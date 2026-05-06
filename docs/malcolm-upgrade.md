# <a name="UpgradePlan"></a>Upgrading Malcolm

At this time there is not an "official" version upgrade procedure for Malcolm, as such procedures vary from platform to platform. However, the process is fairly simple and can be done by following the guidelines outlined in this document.

The Malcolm project uses [calendar versioning](https://calver.org/) for its [releases]({{ site.github.repository_url }}/releases/latest). A careful reading of the release notes between the source and target version before upgrading Malcolm is highly recommended.

## Scenario 1: Malcolm was installed from the [ISO installer](malcolm-hedgehog-e2e-iso-install.md#ISOInstallMalcolm) or a [prepackaged or GitHub release tarball](development.md#Packager)

This tutorial walks through upgrading a Malcolm system (installed via the [ISO Installation](malcolm-hedgehog-e2e-iso-install.md#ISOInstallMalcolm)) to the [latest release]({{ site.github.repository_url }}/releases/latest) of Malcolm (`v{{ site.malcolm.version }}` at the time of this writing), including the underlying Linux system upgrade, Docker image refresh, Malcolm application file replacement, configuration review, and startup.

This example makes the following assumptions. Commands may need to be adjusted according to individual circumstances.

- The Malcolm user is `analyst`
- Malcolm is installed in `/home/analyst/Malcolm`
- The original Malcolm version is `25.02.0` (based on Debian 12, "Bookworm")
- The target Malcolm version is `{{ site.malcolm.version }}` (based on Debian 13, "Trixie")
- Console or SSH access to the Malcolm instance is available
- Sufficient free disk space for OS packages, Docker images, and backups

The majority of these steps also apply to updating a Docker-based [installation on another Linux system](ubuntu-install-example.md#InstallationExample), although the steps relating to upgrading the underlying operating system will likely differ.

---

### 1. Stop Malcolm before upgrading the operating system

Before upgrading system packages, [stop Malcolm](running.md#StopAndRestart)
 so containers are not running while packages, Docker components, or system libraries are being upgraded.

Run this as the normal Malcolm user:

```bash
~/Malcolm/scripts/stop
```

---

### 2. Become root

The operating system upgrade requires root privileges.

Depending on how your system is configured, use either `su -` or `sudo su -`.

```bash
su -
```

Enter the root password (or the user's password, if using `sudo`) when prompted.

You should now have a root shell:

```bash
root@malcolmvm:~#
```

---

### 3. Set a safe default file creation mask

Set the root shell’s `umask` to `0022`.

Due to the Malcolm base operating system's [hardened](hardening.md#Hardening) configuration, this ensures files created during the upgrade are generally readable by other users where appropriate, which is the normal default for system administration tasks.

```bash
umask 0022
```

---

### 4. Prepare for `/usr` merge conversion

Debian systems moving forward expect the `/usr` merge layout. Remove the file that tells the system to skip that conversion.

```bash
rm -f /etc/unsupported-skip-usrmerge-conversion
```

Then update the current package index:

```bash
apt update
```

Install the `usrmerge` package:

```bash
apt -y install --no-install-recommends usrmerge
```

This converts the system to the merged `/usr` layout if it has not already been converted.

---

### 5. Change Debian package sources from Bookworm to Trixie

Next, update your APT sources so they point to Debian Trixie instead of Debian Bookworm.

The following commands replace occurrences of `bookworm` with `trixie` in the main APT sources file and any files under `/etc/apt/sources.list.d/`.

```bash
sed -i "s/bookworm/trixie/g" /etc/apt/sources.list /etc/apt/sources.list.d/*
```

After changing the repositories, refresh the package lists:

```bash
apt update
```

---

### 6. Perform the full Debian upgrade

Run the full distribution upgrade:

```bash
apt full-upgrade
```

APT will calculate the changes and show a summary similar to:

```
1030 upgraded, 285 newly installed, 83 to remove and 0 not upgraded.
Need to get 1,136 MB of archives.
After this operation, 1,248 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```

When prompted, enter `Y`.

During the upgrade, you may be asked whether to replace locally modified configuration files. When asked whether to override or replace local changes, choose:

```
No
```

or:

```
Keep the local version currently installed
```

This helps preserve system-specific configuration that may have been customized for your Malcolm installation.

Wait for the upgrade to complete.

---

### 7. Install new packages required by the Malcolm v{{ site.malcolm.version }} ISO configuration

After the Debian upgrade completes, install the new packages used by the Malcolm `v{{ site.malcolm.version }}` base operating system.

This command fetches Malcolm’s package list definitions from GitHub, filters out package lists that are not relevant, combines and deduplicates them, removes comments and blank lines, and installs the resulting package list.

```bash
curl -s "https://api.github.com/repos/idaholab/Malcolm/contents/malcolm-iso/config/package-lists?ref=v{{ site.malcolm.version }}" \
| grep "download_url" \
| cut -d '"' -f 4 \
| grep -Ev "\.binary$|live\.|virtualguest\." \
| while read -r url; do curl -sSL "$url"; echo; done \
| sort -u \
| grep -Ev "^\s*#|^\s*$" \
| xargs -r apt install -y
```

This ensures the upgraded operating system has the expected supporting packages for this Malcolm release.

---

### 8. Reboot the system

Once the OS upgrade and package installation are complete, reboot the system.

```bash
reboot
```

Your SSH or conosole session will disconnect:

```
Connection to 192.168.122.13 closed by remote host.
Connection to 192.168.122.13 closed.
```

Wait for the system to come back online, then reconnect.

---

### 9. Stop Malcolm again after reboot

After logging back in as the normal Malcolm user, stop Malcolm again to make sure no services are running before continuing with the application upgrade.

```bash
~/Malcolm/scripts/stop
```

This is safe to run even if Malcolm is not currently running.

---

### 10. Become root and remove unused packages

Become root again:

```bash
su -
```

Set the `umask` again:

```bash
umask 0022
```

Remove packages that were automatically installed but are no longer required after the OS upgrade:

```bash
apt -y autoremove
```

When that completes, exit the root shell:

```bash
exit
```

You should now be back as the normal Malcolm user.

---

### 11. Remove old Malcolm Docker images

Remove existing Docker images from the `idaholab/malcolm` repository.

This clears out old Malcolm container images so the new release images can be loaded cleanly.

```bash
docker images --format=table | grep idaholab/malcolm | \
    awk '{print $3}' | xargs -r -l docker rmi -f
```

This command:

1. Lists Docker images
2. Filters for images matching `idaholab/malcolm`
3. Extracts the image IDs
4. Removes those images forcibly

---

### 12. Download the Malcolm v{{ site.malcolm.version }} release artifacts

Create a `Downloads` directory and move into it:

```bash
mkdir -p ~/Downloads
cd ~/Downloads
```

Download the required release files from the Malcolm `v{{ site.malcolm.version }}` GitHub release:

```bash
curl -s https://api.github.com/repos/idaholab/Malcolm/releases/tags/v{{ site.malcolm.version }} \
  | grep "browser_download_url" \
  | grep -E "(docker_install\.zip|release_cleaver\.sh|malcolm.*_images\.tar\.xz)" \
  | cut -d '"' -f 4 \
  | xargs -r -I {} curl -L -O {}
```

This downloads files such as:

- `release_cleaver.sh`
- `malcolm-{{ site.malcolm.version }}-docker_install.zip`
- Split Docker image archive files named similar to:
  - `malcolm-{{ site.malcolm.version }}_images.tar.xz.01`
  - `malcolm-{{ site.malcolm.version }}_images.tar.xz.02`
  - `malcolm-{{ site.malcolm.version }}_images.tar.xz.03`
  - `malcolm-{{ site.malcolm.version }}_images.tar.xz.04`
  - `malcolm-{{ site.malcolm.version }}_images.tar.xz.sha`

Users may optionally exclude the `|malcolm.*_images\.tar\.xz` portion of the pattern above and pull the new images from GitHub's [ghcr.io container registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) later using `docker compose pull`. In that case, skip ahead to **Extract the Malcolm application archive**.

---

### 13. Reassemble the split Docker image archive

Users opting to pull the new Malcolm container images later using `docker compose pull` should skip this step.

Make the release helper script executable:

```bash
chmod +x release_cleaver.sh
```

Use it to join the split Docker image archive:

```bash
./release_cleaver.sh malcolm-{{ site.malcolm.version }}_images.tar.xz.*
```

You should see output similar to:

```
Joining...
malcolm-{{ site.malcolm.version }}_images.tar.xz: OK
```

After the full archive has been successfully reassembled and verified, remove the split parts:

```bash
rm -f malcolm-{{ site.malcolm.version }}_images.tar.xz.*
```

---

### 14. Load the Malcolm Docker images

Users opting to pull the new Malcolm container images later using `docker compose pull` should skip this step.

Load the new Malcolm Docker images into the local Docker image cache:

```bash
docker load -i malcolm-{{ site.malcolm.version }}_images.tar.xz
```

This may take some time.

After the images are loaded, remove the large archive to reclaim disk space:

```bash
rm -f malcolm-{{ site.malcolm.version }}_images.tar.xz
```

---

### 15. Extract the Malcolm application archive

The Docker install ZIP contains a `.tar.gz` archive with the Malcolm application files.

Extract only the `.tar.gz` file from the ZIP:

```bash
unzip malcolm-{{ site.malcolm.version }}-docker_install.zip "*.tar.gz"
```

You should see output similar to:

```
Archive:  malcolm-{{ site.malcolm.version }}-docker_install.zip
  inflating: malcolm_########_######_########.tar.gz
```

Extract the `.tar.gz` archive:

```bash
tar xf malcolm_########_######_########.tar.gz
```

This creates a directory similar to:

```
malcolm_########_######_########/
```

Return to your home directory:

```bash
cd ~
```

---

### 16. Back up the existing Malcolm application directory

Before replacing the existing Malcolm application files, create a backup.

This backup intentionally excludes large runtime data directories such as OpenSearch data, packet captures, Zeek logs, Suricata logs, and filescan logs.

```bash
rsync -av \
  --exclude='opensearch/*' \
  --exclude='pcap/*' \
  --exclude='suricata-logs/*' \
  --exclude='zeek-logs/*' \
  --exclude='filescan-logs/*' \
  /home/analyst/Malcolm/ \
  /home/analyst/Malcolm-25.02.0-bak/
```

This creates a backup at:

```
/home/analyst/Malcolm-25.02.0-bak/
```

The trailing slashes are important:

- `/home/analyst/Malcolm/` means “copy the contents of this directory”
- `/home/analyst/Malcolm-25.02.0-bak/` is the backup destination

---

### 17. Preview the Malcolm application file update

Before copying the new Malcolm files into place, perform a dry run.

```bash
rsync -av --dry-run --exclude='.opensearch.*.curlrc' \
  /home/analyst/Downloads/malcolm_########_######_########/ \
  /home/analyst/Malcolm/
```

This shows what would be copied, updated, or removed without actually changing anything.

The command excludes files matching:

```
.opensearch.*.curlrc
```

Those files may contain local OpenSearch authentication or connection settings that should not be overwritten with their empty default files.

Review the output before continuing.

---

### 18. Apply the Malcolm application file update

If the dry run looks correct, run the same `rsync` command without `--dry-run`:

```bash
rsync -av --exclude='.opensearch.*.curlrc' \
  /home/analyst/Downloads/malcolm_########_######_########/ \
  /home/analyst/Malcolm/
```

This updates the existing Malcolm directory with the `v{{ site.malcolm.version }}` application files.

---

### 19. Update `.os-info` for the new Malcolm version

Change into the Malcolm directory:

```bash
cd ~/Malcolm
```

Update `.os-info` so it reflects the new Malcolm variant and version information:

```bash
ver="{{ site.malcolm.version }}"; sed -i -E \
  -e 's/^(VARIANT_ID=")hedgehog-malcolm(")$/\1malcolm\2/' \
  -e 's/^(VARIANT_ID=")hedgehog-sensor(")$/\1hedgehog\2/' \
  -e "s/^(VARIANT=\".*)v[0-9]+\\.[0-9]+\\.[0-9]+(.*\")$/\1v${ver}\2/" \
  -e "s/^(BUILD_ID=\").*(\")$/\1$(date +%F)-${ver}\2/" \
  .os-info
```

This command:

- Normalizes older `VARIANT_ID` values if needed
- Updates the displayed Malcolm version to `v{{ site.malcolm.version }}`
- Updates the `BUILD_ID` to include the current date and version

---

### 20. Check Malcolm container status

Run the `status` script to will migrate some of the [configuration values]({{ site.github.repository_url }}/blob/{{ site.github.build_revision }}/config) from the previous Malcolm version and populate new values with their defaults.

```bash
./scripts/status
```

Since Malcolm is not running, you will see output similar to:

```
NAME      IMAGE     COMMAND   SERVICE   CREATED   STATUS    PORTS
```

---

### 21. Run Malcolm configuration

Run the Malcolm [configuration](malcolm-hedgehog-e2e-iso-install.md#MalcolmConfig) script:

```bash
./scripts/configure
```

Review the [configuration menu items](malcolm-hedgehog-e2e-iso-install.md#MalcolmConfigItems) carefully.

This step allows you to confirm or update Malcolm’s configuration for the new version.

---

### 22. Run authentication setup

Run the [authentication setup](malcolm-hedgehog-e2e-iso-install.md#MalcolmAuthSetup) script:

```bash
./scripts/auth_setup
```

During this step:

- Verify the authentication method
- Do **not** regenerate self-signed certificates unless you intentionally want to replace them (including on any sensors previously communicating with this Malcolm instance)
- Do **not** overwrite existing passwords unless you intentionally want to reset them

The goal is to preserve your existing authentication material while ensuring the upgraded installation is configured correctly.

---

### 23. Optional: Pull Docker images (if they were not loaded earlier)

If you already loaded the Docker images using `docker load`, you can skip this step.

If you did not load the release image archive, pull the required images instead:

```bash
docker compose --profile=malcolm pull
```

This downloads the Malcolm images from the GitHub container registry.

---

### 24. Start Malcolm

[Start Malcolm](running.md#Running):

```bash
./scripts/start
```

The startup process may take several minutes.

---

### 25. Verify Malcolm is running

Check container status:

```bash
./scripts/status
```

Confirm that the expected Malcolm services are running and healthy.

---

### 26. Post-upgrade checks

After Malcolm starts successfully, perform the following checks:

1. Log into the Malcolm [web interface](quickstart.md#UserInterfaceURLs).
2. Confirm authentication still works.
3. Verify OpenSearch dashboards load.
4. Confirm previously collected data is present if expected.

Technically minded users may wish to follow the debug output provided by `./scripts/start` (use `./scripts/logs` to re-open the log stream after it's been closed), although there is a lot there and it may be hard to distinguish whether or not something is okay.

```bash
./scripts/logs
```

If a specific service has issues, inspect that service’s logs, for example:

```bash
./scripts/logs -s opensearch
./scripts/logs -s arkime
./scripts/logs -s dashboards
```

---

### Summary

The upgrade process consists of five major phases:

1. Stop Malcolm
2. Upgrade underlying Debian operating system
3. Install required Malcolm system packages
4. Replace the Malcolm application files and Docker images for `v{{ site.malcolm.version }}`
5. Reconfigure, verify authentication, and restart Malcolm

After completing these steps, the system should be running Malcolm `v{{ site.malcolm.version }}` on the upgraded Debian base.

## Scenario 2: Malcolm is a GitHub clone

Here are the basic steps to perform an upgrade if Malcolm was checked with a `git clone` command:

1. stop Malcolm
    * `./scripts/stop`
2. stash changes to `docker-compose.yml` and other files
    * `git stash save "pre-upgrade Malcolm configuration changes"`
3. save a backup of the [environment variable files](malcolm-config.md#MalcolmConfigEnvVars) in the Malcolm `./config/` directory
4. pull changes from GitHub repository
    * `git pull --rebase`
5. pull new images (this will take a while)
    * `docker compose --profile malcolm pull`
6. apply saved configuration change stashed earlier
    * `git stash pop`
7. if `Merge conflict` messages appear, resolve the [conflicts](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging#_basic_merge_conflicts) with a text editor
8. re-run `./scripts/configure` as described in [Malcolm Configuration](malcolm-hedgehog-e2e-iso-install.md#MalcolmConfig) in case there are any new configuration parameters for Malcolm that need to be set up
9. start Malcolm
    * `./scripts/start`
10. users may be prompted to [configure authentication](authsetup.md#AuthSetup) if there are new authentication-related files that need to be generated
    * users probably do not need to re-generate self-signed certificates




## documentation update



```
analyst@malcolmvm:~$ ~/Malcolm/scripts/stop
# "sudo su -" or "su -" to become root, depending on configuration
analyst@malcolmvm:~$ su -
Password:
root@malcolmvm:~# umask 0022
root@malcolmvm:~# rm -f /etc/unsupported-skip-usrmerge-conversion
root@malcolmvm:~# apt update
...
Reading package lists... Done
root@malcolmvm:~# apt -y install --no-install-recommends usrmerge
Reading package lists... Done
...
root@malcolmvm:/etc/apt# sed -i "s/bookworm/trixie/g" /etc/apt/sources.list
root@malcolmvm:/etc/apt# sed -i "s/bookworm/trixie/g" /etc/apt/sources.list.d/*
root@malcolmvm:/etc/apt# apt update
...
Reading package lists... Done
root@malcolmvm:/etc/apt# apt full-upgrade
Reading package lists... Done
...
1030 upgraded, 285 newly installed, 83 to remove and 0 not upgraded.
Need to get 1,136 MB of archives.
After this operation, 1,248 MB of additional disk space will be used.
Do you want to continue? [Y/n]  Y
...
# when asked whether to override/replace local changes to files, select
# "no" or "keep the local version currently installed"
done

root@malcolmvm:~# curl -s "https://api.github.com/repos/idaholab/Malcolm/contents/malcolm-iso/config/package-lists?ref=v{{ site.malcolm.version }}" \
| grep "download_url" \
| cut -d '"' -f 4 \
| grep -Ev "\.binary$|live\.|virtualguest\." \
| while read -r url; do curl -sSL "$url"; echo; done \
| sort -u \
| grep -Ev "^\s*#|^\s*$" \
| xargs sudo apt install -y
root@malcolmvm:~# reboot

Broadcast message from root@malcolmvm on pts/1 (Wed 2026-05-06 14:55:54 UTC):

The system will reboot now!

Connection to 192.168.122.13 closed by remote host.
Connection to 192.168.122.13 closed.
```

```
analyst@malcolmvm:~$ ~/Malcolm/scripts/stop
# "sudo su -" or "su -" to become root, depending on configuration
analyst@malcolmvm:~$ su -
Password:
root@malcolmvm:~# umask 0022
root@malcolmvm:~# apt -y autoremove
...
root@malcolmvm:~# exit
logout

analyst@malcolmvm:~$ docker images --format=table | grep idaholab/malcolm | \
                     awk '{print $3}' | xargs -r -l docker rmi -f

analyst@malcolmvm:~$ mkdir -p Downloads
analyst@malcolmvm:~$ cd Downloads
analyst@malcolmvm:~$ curl -s https://api.github.com/repos/idaholab/Malcolm/releases/tags/v{{ site.malcolm.version }} \
  | grep "browser_download_url" \
  | grep -E "(docker_install\.zip|release_cleaver\.sh|malcolm.*_images\.tar\.xz)" \
  | cut -d '"' -f 4 \
  | xargs -I {} curl -L -O {}

analyst@malcolmvm:Downloads$ chmod +x release_cleaver.sh
analyst@malcolmvm:Downloads$ ./release_cleaver.sh malcolm-{{ site.malcolm.version }}_images.tar.xz.*
Joining...
malcolm-{{ site.malcolm.version }}_images.tar.xz: OK
analyst@malcolmvm:Downloads$ rm -f malcolm-{{ site.malcolm.version }}_images.tar.xz.*
removed 'malcolm-{{ site.malcolm.version }}_images.tar.xz.01'
removed 'malcolm-{{ site.malcolm.version }}_images.tar.xz.02'
removed 'malcolm-{{ site.malcolm.version }}_images.tar.xz.03'
removed 'malcolm-{{ site.malcolm.version }}_images.tar.xz.04'
removed 'malcolm-{{ site.malcolm.version }}_images.tar.xz.sha'
analyst@malcolmvm:Downloads$ docker load -i malcolm-{{ site.malcolm.version }}_images.tar.xz
analyst@malcolmvm:Downloads$ rm -f malcolm-{{ site.malcolm.version }}_images.tar.xz
analyst@malcolmvm:Downloads$ unzip malcolm-{{ site.malcolm.version }}-docker_install.zip "*.tar.gz"
Archive:  malcolm-{{ site.malcolm.version }}-docker_install.zip
  inflating: malcolm_########_######_########.tar.gz
analyst@malcolmvm:Downloads$ tar xf malcolm_########_######_########.tar.gz
analyst@malcolmvm:Downloads$ cd ~
analyst@malcolmvm:~$ rsync -av \
  --exclude='opensearch/*' \
  --exclude='pcap/*' \
  --exclude='suricata-logs/*' \
  --exclude='zeek-logs/*' \
  --exclude='filescan-logs/*' \
  /home/analyst/Malcolm/ \
  /home/analyst/Malcolm-25.02.0-bak/

analyst@malcolmvm:~$ rsync -av --dry-run --exclude='.opensearch.*.curlrc' \
  /home/analyst/Downloads/malcolm_########_######_########/ \
  /home/analyst/Malcolm/
sending incremental file list
...

analyst@malcolmvm:~$ rsync -av --exclude='.opensearch.*.curlrc' \
  /home/analyst/Downloads/malcolm_########_######_########/ \
  /home/analyst/Malcolm/
sending incremental file list
...

analyst@malcolmvm:~$ cd ~/Malcolm
analyst@malcolmvm:~$ ver="{{ site.malcolm.version }}"; sed -i -E \
  -e 's/^(VARIANT_ID=")hedgehog-malcolm(")$/\1malcolm\2/' \
  -e 's/^(VARIANT_ID=")hedgehog-sensor(")$/\1hedgehog\2/' \
  -e "s/^(VARIANT=\".*)v[0-9]+\\.[0-9]+\\.[0-9]+(.*\")$/\1v${ver}\2/" \
  -e "s/^(BUILD_ID=\").*(\")$/\1$(date +%F)-${ver}\2/" \
  .os-info
analyst@malcolmvm:Malcolm$ ./scripts/status
NAME      IMAGE     COMMAND   SERVICE   CREATED   STATUS    PORTS

analyst@malcolmvm:Malcolm$ ./scripts/configure
...
analyst@malcolmvm:Malcolm$ ./scripts/auth_setup
# verify authentication method, don't re-generate self-signed certificates or overwrite existing passwords
...

# if you didn't load the images earlier:
analyst@malcolmvm:Malcolm$ docker compose --profile=malcolm pull
analyst@malcolmvm:Malcolm$ ./scripts/start

```