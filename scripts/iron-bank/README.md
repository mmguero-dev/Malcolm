
# Clone all Malcolm Iron Bank repositories

```bash
IRON_BANK_PARENT_PATH=/path/to/iron-bank
mkdir -p "$IRON_BANK_PARENT_PATH"

for REPO in \
    api \
    arkime \
    dashboards \
    dashboards-helper \
    dirinit \
    filebeat \
    filescan \
    file-upload \
    freq \
    htadmin \
    keycloak \
    logstash-oss \
    netbox \
    nginx \
    opensearch \
    pcap-capture \
    pcap-monitor \
    postgresql \
    redis \
    strelka-backend \
    strelka-frontend \
    strelka-manager \
    suricata \
    zeek \
; do
    git clone https://repo1.dso.mil/dsop/afdco/malcolm/"$REPO".git
    pushd "$REPO" >/dev/null 2>&1
    for BRANCH in master development inl-26.x; do
        git checkout "$BRANCH"
    done
    popd >/dev/null 2>&1
done
```

# Perform some action in each Malcolm Iron Bank repository working copy

```bash
IRON_BANK_PARENT_PATH=/path/to/iron-bank

for REPO_DIR in $(find /path/to/iron-bank -mindepth 1 -maxdepth 1 -type d | sed "s@\./@@") \
; do
    pushd "$REPO_DIR" >/dev/null 2>&1
    REPO_NAME="$(basename `git config --get remote.origin.url` | sed 's/\.git$//')"
    git status;
    popd >/dev/null 2>&1
done
```

# Pull VAT findings for each repo

```bash
mkdir /path/to/findings

for REPO_DIR in $(find /path/to/iron-bank -mindepth 1 -maxdepth 1 -type d | sed "s@\./@@") \
; do
    pushd "$REPO_DIR" >/dev/null 2>&1
    REPO_NAME="$(basename `git config --get remote.origin.url` | sed 's/\.git$//')"
    gitlab-artifacts-download.py \
        -p "$REPO_NAME" \
        -b inl-26.x \
        -j vat \
        -L \
        -S "Needs Justification" -S "Needs Rework" -S "Needs Reverified" \
        -f json > /path/to/findings/"$REPO_NAME".json
    popd >/dev/null 2>&1
done
```
