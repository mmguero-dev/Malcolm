#!/usr/bin/env bash

set -uo pipefail

failures=0
warnings=0

section() {
    printf '\n=== %s ===\n' "$1"
}

pass() {
    printf 'PASS: %s\n' "$1"
}

warn() {
    printf 'WARN: %s\n' "$1"
    warnings=$((warnings + 1))
}

fail() {
    printf 'FAIL: %s\n' "$1"
    failures=$((failures + 1))
}

show_file() {
    local label="$1"
    local path="$2"

    if [[ -r "$path" ]]; then
        printf '%s: %s\n' "$label" "$(tr -d '\000' < "$path")"
    else
        warn "$label is unavailable at $path"
    fi
}

has_cmd() {
    command -v "$1" >/dev/null 2>&1
}

kernel_release="$(uname -r)"
kernel_log="$(dmesg 2>/dev/null || journalctl -k -b --no-pager 2>/dev/null || true)"

section "kernel"
printf 'release: %s\n' "$kernel_release"
printf 'architecture: %s\n' "$(uname -m)"
printf 'page size: %s\n' "$(getconf PAGESIZE)"
[[ "$kernel_release" == *hedgehog-rpi* ]] && pass "Hedgehog Raspberry Pi kernel is running" || fail "unexpected kernel release"
[[ "$(uname -m)" == "aarch64" ]] && pass "64-bit ARM kernel" || fail "kernel architecture is not aarch64"
[[ "$(getconf PAGESIZE)" == "4096" ]] && pass "4 KiB page size" || warn "page size differs from the tested 4096-byte configuration"

kernel_config="/boot/config-$kernel_release"
for config_entry in \
    CONFIG_THERMAL=y \
    CONFIG_BCM2711_THERMAL=m \
    CONFIG_SENSORS_PWM_FAN=m \
    CONFIG_PWM_RP1=m \
    CONFIG_PCIE_BRCMSTB=y \
    CONFIG_MFD_RP1=y \
    CONFIG_DRM_VC4=m \
    CONFIG_DRM_V3D=m \
    CONFIG_FB_SIMPLE=y; do
    if [[ -r "$kernel_config" ]] && grep -Fxq "$config_entry" "$kernel_config"; then
        pass "$config_entry"
    else
        fail "$config_entry is missing from $kernel_config"
    fi
done

section "USB root and filesystems"
findmnt -no TARGET,SOURCE,FSTYPE,OPTIONS /
findmnt -no TARGET,SOURCE,FSTYPE,OPTIONS /boot/firmware
lsblk -o NAME,TRAN,SIZE,FSTYPE,LABEL,MOUNTPOINTS
root_source="$(findmnt -no SOURCE /)"
root_label="$(findmnt -no LABEL / 2>/dev/null || true)"
firmware_label="$(findmnt -no LABEL /boot/firmware 2>/dev/null || true)"
[[ "$root_label" == "RASPIROOT" ]] && pass "root label is RASPIROOT" || fail "root label is '$root_label'"
[[ "$firmware_label" == "RASPIFIRM" ]] && pass "firmware label is RASPIFIRM" || fail "firmware label is '$firmware_label'"
root_disk="$(lsblk -ndo PKNAME "$root_source" 2>/dev/null || true)"
root_transport="$(lsblk -ndo TRAN "/dev/$root_disk" 2>/dev/null || true)"
[[ "$root_transport" == "usb" ]] && pass "root filesystem is on USB storage" || fail "root transport is '${root_transport:-unknown}'"

section "boot configuration"
config_file=/boot/firmware/config.txt
cmdline_file=/boot/firmware/cmdline.txt
persistent_cmdline=/etc/default/raspi-extra-cmdline
for entry in \
    'upstream_kernel=1' \
    'device_tree=bcm2712-d-rpi-5-b.dtb' \
    'dtoverlay=vc4-kms-v3d-pi5,cma-256' \
    'max_framebuffers=2' \
    'disable_fw_kms_setup=1' \
    'dtparam=cooling_fan=on'; do
    if grep -Fxq "$entry" "$config_file" 2>/dev/null; then
        pass "$entry"
    else
        fail "$entry is missing from config.txt"
    fi
done

if grep -Fxq 'CMA=0' /etc/default/raspi-firmware 2>/dev/null; then
    pass "raspi-firmware command-line CMA is disabled"
else
    fail "CMA=0 is missing from /etc/default/raspi-firmware"
fi

for source in /proc/cmdline "$cmdline_file" "$persistent_cmdline"; do
    if tr ' ' '\n' < "$source" 2>/dev/null | grep -Eq '^cma='; then
        fail "$source contains a cma= argument"
    else
        pass "$source has no cma= argument"
    fi

    if tr ' ' '\n' < "$source" 2>/dev/null |
        grep -Eq '^(module_blacklist|modprobe[.]blacklist|rd[.]driver[.]blacklist)=vc4$'; then
        fail "$source contains a VC4 blacklist"
    else
        pass "$source has no VC4 blacklist"
    fi
done

if [[ -e /etc/modprobe.d/hedgehog-vc4.conf ]]; then
    fail "/etc/modprobe.d/hedgehog-vc4.conf still exists"
else
    pass "temporary VC4 modprobe restriction is absent"
fi

for boot_file in \
    "/boot/firmware/vmlinuz-$kernel_release" \
    "/boot/firmware/initrd.img-$kernel_release" \
    /boot/firmware/bcm2712-d-rpi-5-b.dtb \
    /boot/firmware/overlays/vc4-kms-v3d-pi5.dtbo; do
    [[ -s "$boot_file" ]] && pass "$boot_file" || fail "$boot_file is missing or empty"
done

section "CMA"
cma_total="$(awk '/^CmaTotal:/ {print $2}' /proc/meminfo)"
cma_free="$(awk '/^CmaFree:/ {print $2}' /proc/meminfo)"
printf 'CmaTotal: %s kB\n' "${cma_total:-unknown}"
printf 'CmaFree: %s kB\n' "${cma_free:-unknown}"
[[ "$cma_total" == "262144" ]] && pass "runtime CMA size is 256 MiB" || fail "runtime CMA size is not 256 MiB"

live_cma_size=/proc/device-tree/reserved-memory/linux,cma/size
if [[ -r "$live_cma_size" ]]; then
    live_cma_size_bytes="$(wc -c < "$live_cma_size")"
    live_cma_size_hex="$(od -An -tx1 -v "$live_cma_size" | tr -d ' \n')"
    printf 'DT linux,cma size: %s bytes, %s\n' "$live_cma_size_bytes" "$live_cma_size_hex"
    [[ "$live_cma_size_bytes" == "8" ]] && pass "live CMA size property uses two cells" || fail "live CMA size property is not eight bytes"
    [[ "$live_cma_size_hex" == "0000000010000000" ]] && pass "live device tree requests 256 MiB CMA" || fail "unexpected live CMA size property"
else
    fail "live linux,cma size property is missing"
fi

cma_line="$(grep -m1 'created CMA memory pool at' <<< "$kernel_log" || true)"
printf '%s\n' "${cma_line:-CMA allocation log line unavailable}"
cma_address="$(sed -nE 's/.* at (0x[0-9a-fA-F]+),.*/\1/p' <<< "$cma_line")"
if [[ "$cma_address" =~ ^0x[0-9a-fA-F]+$ ]] && (( cma_address < 0x40000000 )); then
    pass "CMA begins below the firmware mailbox 1 GiB limit"
else
    fail "CMA address is missing or outside the first 1 GiB"
fi

section "firmware mailbox, CPU scaling, and RTC"
mailbox_errors="$(grep -Ei \
    'returned status|mailbox.*(fail|error)|raspberrypi-clk.*failed|vc4_hvs.*Couldn.t get core clock|rpi-rtc.*failed' \
    <<< "$kernel_log" || true)"
if [[ -z "$mailbox_errors" ]]; then
    pass "no mailbox, firmware-clock, or RTC probe errors"
else
    fail "mailbox or firmware-dependent driver errors were logged"
    printf '%s\n' "$mailbox_errors"
fi

policy=/sys/devices/system/cpu/cpufreq/policy0
if [[ -d "$policy" ]]; then
    show_file scaling_driver "$policy/scaling_driver"
    show_file scaling_governor "$policy/scaling_governor"
    show_file scaling_cur_freq "$policy/scaling_cur_freq"
    show_file cpuinfo_min_freq "$policy/cpuinfo_min_freq"
    show_file cpuinfo_max_freq "$policy/cpuinfo_max_freq"
    [[ "$(< "$policy/scaling_driver")" == "cpufreq-dt" ]] && pass "CPU-frequency scaling uses cpufreq-dt" || fail "unexpected CPU-frequency scaling driver"
else
    fail "CPU-frequency scaling policy0 is missing"
fi

if [[ -e /dev/rtc0 ]]; then
    pass "/dev/rtc0 exists"
    if has_cmd hwclock; then
        if rtc_value="$(hwclock --show --utc 2>&1)"; then
            printf 'RTC: %s\n' "$rtc_value"
            pass "RTC can be read"
        else
            fail "hwclock could not read the RTC: $rtc_value"
        fi
    else
        warn "hwclock is not installed"
    fi
else
    fail "/dev/rtc0 is missing"
fi

if has_cmd vcgencmd; then
    if firmware_temp="$(vcgencmd measure_temp 2>&1)"; then
        printf '%s\n' "$firmware_temp"
        pass "vcgencmd can use the firmware mailbox"
    else
        fail "vcgencmd failed: $firmware_temp"
    fi
else
    warn "vcgencmd is not installed; kernel mailbox checks were used"
fi

section "display and console"
lsmod | grep -E '^(vc4|v3d|drm)' || true
for module in vc4 v3d; do
    grep -q "^$module " /proc/modules && pass "$module is loaded" || fail "$module is not loaded"
done
[[ -c /dev/fb0 ]] && pass "/dev/fb0 exists" || fail "/dev/fb0 is missing"
show_file framebuffer_name /sys/class/graphics/fb0/name
[[ -r /sys/class/graphics/fb0/name && "$(< /sys/class/graphics/fb0/name)" == "vc4drmfb" ]] && pass "VC4 owns the framebuffer" || fail "framebuffer is not vc4drmfb"
[[ -c /dev/dri/card0 ]] && pass "/dev/dri/card0 exists" || fail "/dev/dri/card0 is missing"
[[ -c /dev/dri/renderD128 ]] && pass "/dev/dri/renderD128 exists" || fail "/dev/dri/renderD128 is missing"
systemctl is-active --quiet getty@tty1.service && pass "tty1 login service is active" || fail "tty1 login service is not active"

display_errors="$(grep -Ei \
    'vc4.*(fail|error)|v3d.*(fail|error)|drm.*(fail|error)|Couldn.t stop firmware display driver|Couldn.t get core clock' \
    <<< "$kernel_log" || true)"
if [[ -z "$display_errors" ]]; then
    pass "no VC4, V3D, or DRM failures were logged"
else
    fail "display-driver errors were logged"
    printf '%s\n' "$display_errors"
fi

section "thermal sensor and fan"
for module in pwm_rp1 pwm_fan; do
    grep -q "^$module " /proc/modules && pass "$module is loaded" || fail "$module is not loaded"
done

thermal_zone=/sys/class/thermal/thermal_zone0
if [[ -d "$thermal_zone" ]]; then
    thermal_type="$(< "$thermal_zone/type")"
    temperature="$(< "$thermal_zone/temp")"
    printf 'zone: %s\n' "$thermal_type"
    awk -v value="$temperature" 'BEGIN { printf "temperature: %.1f C\n", value / 1000 }'
    [[ "$thermal_type" == "cpu-thermal" ]] && pass "CPU thermal zone is registered" || fail "unexpected thermal-zone type"
    (( temperature > 0 && temperature < 110000 )) && pass "temperature is plausible" || fail "temperature is outside the expected range"
    for trip in "$thermal_zone"/trip_point_*_temp; do
        [[ -e "$trip" ]] || continue
        base="${trip%_temp}"
        printf '%s: %s mC, type=%s\n' "${base##*/}" "$(< "$trip")" "$(< "${base}_type")"
    done
else
    fail "CPU thermal zone is missing"
fi

fan_device=""
for device in /sys/class/thermal/cooling_device*; do
    [[ -d "$device" ]] || continue
    if [[ "$(< "$device/type")" == "pwm-fan" ]]; then
        fan_device="$device"
        break
    fi
done

if [[ -n "$fan_device" ]]; then
    printf 'fan device: %s\n' "$fan_device"
    printf 'fan state: %s/%s\n' "$(< "$fan_device/cur_state")" "$(< "$fan_device/max_state")"
    pass "pwm-fan cooling device is registered"
else
    fail "pwm-fan cooling device is missing"
fi

fan_hwmon=""
for hwmon in /sys/class/hwmon/hwmon*; do
    [[ -r "$hwmon/name" ]] || continue
    if [[ "$(< "$hwmon/name")" == "pwmfan" ]]; then
        fan_hwmon="$hwmon"
        break
    fi
done

if [[ -n "$fan_hwmon" ]]; then
    show_file fan_pwm "$fan_hwmon/pwm1"
    show_file fan_pwm_enable "$fan_hwmon/pwm1_enable"
    [[ -r "$fan_hwmon/fan1_input" ]] && show_file fan_rpm "$fan_hwmon/fan1_input"
    pass "fan hwmon device is registered"
else
    fail "fan hwmon device is missing"
fi

section "initramfs and USB-root drivers"
initrd="/boot/initrd.img-$kernel_release"
modules_builtin="/lib/modules/$kernel_release/modules.builtin"
if has_cmd lsinitrd && [[ -r "$initrd" && -r "$modules_builtin" ]]; then
    initrd_listing="$(lsinitrd "$initrd" 2>/dev/null || true)"
    builtin_listing="$(tr '_' '-' < "$modules_builtin")"
    normalized_initrd_listing="$(tr '_' '-' <<< "$initrd_listing")"
    for driver in \
        irq-bcm2712-mip \
        pcie-brcmstb \
        rp1 \
        xhci-hcd \
        xhci-pci \
        xhci-plat-hcd \
        usb-storage \
        uas; do
        if grep -Eq "/${driver}[.]ko([.]|$)" <<< "$builtin_listing" ||
            grep -Eq "/${driver}[.]ko([.]|$)" <<< "$normalized_initrd_listing"; then
            pass "$driver is built in or present in the initramfs"
        else
            fail "$driver is absent from both modules.builtin and the initramfs"
        fi
    done
else
    fail "lsinitrd, initramfs, or modules.builtin is unavailable"
fi

section "Wi-Fi and Bluetooth"
for package in firmware-brcm80211 bluez-firmware raspi-firmware; do
    package_status="$(dpkg-query -W -f='${db:Status-Abbrev} ${Version}' "$package" 2>/dev/null || true)"
    printf '%s: %s\n' "$package" "${package_status:-not installed}"
    [[ "$package_status" == ii\ * ]] && pass "$package is installed" || fail "$package is not installed"
done

if [[ -d /sys/class/net/wlan0 ]]; then
    pass "wlan0 exists"
    ip -brief link show wlan0
else
    fail "wlan0 is missing"
fi

if grep -q 'brcmf_c_preinit_dcmds: Firmware:' <<< "$kernel_log"; then
    pass "Broadcom Wi-Fi firmware initialized"
else
    fail "successful Broadcom Wi-Fi firmware initialization was not logged"
fi

if [[ -d /sys/class/bluetooth/hci0 ]]; then
    pass "Bluetooth hci0 exists"
    has_cmd bluetoothctl && bluetoothctl show || true
else
    fail "Bluetooth hci0 is missing"
fi

if grep -Eq 'Bluetooth: hci0: BCM4345C0.*build|Bluetooth: hci0: BCM43455' <<< "$kernel_log"; then
    pass "Broadcom Bluetooth firmware initialized"
else
    fail "successful Broadcom Bluetooth firmware initialization was not logged"
fi

section "Ethernet"
if [[ -d /sys/class/net/eth0 ]]; then
    pass "eth0 exists"
    ip -brief link show eth0
    if has_cmd ethtool; then
        ethtool eth0 2>/dev/null | grep -E 'Speed:|Duplex:|Link detected:' || true
    else
        warn "ethtool is not installed"
    fi
else
    fail "eth0 is missing"
fi

section "memory, cgroups, and Docker"
free -h
printf 'online CPUs: %s\n' "$(nproc)"
[[ "$(stat -fc %T /sys/fs/cgroup)" == "cgroup2fs" ]] && pass "cgroup v2 is active" || fail "cgroup v2 is not active"
grep -wq memory /sys/fs/cgroup/cgroup.controllers && pass "cgroup memory controller is available" || fail "cgroup memory controller is missing"
if has_cmd docker; then
    if systemctl is-active --quiet docker; then
        pass "Docker service is active"
        docker info --format 'driver={{.Driver}} cgroup={{.CgroupDriver}} version={{.CgroupVersion}} cpus={{.NCPU}} memory={{.MemTotal}}' 2>/dev/null || warn "docker info failed"
    else
        fail "Docker service is not active"
    fi
else
    warn "Docker is not installed"
fi

section "camera and hardware codecs"
camera_modules="$(lsmod | grep -E '^(rp1_cfe|bcm2835_codec|rpi_hevc_dec|pisp_be)' || true)"
printf '%s\n' "${camera_modules:-no camera or codec modules currently loaded}"
find /dev -maxdepth 1 \( -name 'video*' -o -name 'media*' \) -printf '%f\n' 2>/dev/null | sort || true
for symbol in \
    CONFIG_VIDEO_RPI_HEVC_DEC \
    CONFIG_VIDEO_CODEC_BCM2835 \
    CONFIG_VIDEO_RASPBERRYPI_PISP_BE \
    CONFIG_VIDEO_RP1_CFE \
    CONFIG_VIDEO_RP1_CFE_DOWNSTREAM; do
    value="$(grep -E "^${symbol}=(y|m)$" "$kernel_config" 2>/dev/null || true)"
    if [[ -n "$value" ]]; then
        pass "$value"
    else
        fail "$symbol is not enabled"
    fi
done

for module in rpi_hevc_dec pisp_be; do
    grep -q "^$module " /proc/modules && pass "$module is loaded" || fail "$module is not loaded"
done

video_device_names="$(
    for device in /sys/class/video4linux/video*; do
        [[ -r "$device/name" ]] || continue
        cat "$device/name"
    done
)"
grep -Fxq 'rpi-hevc-dec' <<< "$video_device_names" &&
    pass "Raspberry Pi HEVC decoder registered a V4L2 device" ||
    fail "Raspberry Pi HEVC decoder V4L2 device is missing"

pisp_input_count="$(grep -Fxc 'pispbe-input' <<< "$video_device_names" || true)"
[[ "$pisp_input_count" == "2" ]] &&
    pass "both PiSP back-end instances registered V4L2 devices" ||
    fail "expected two PiSP back-end instances, found $pisp_input_count"

if has_cmd v4l2-ctl; then
    v4l2_devices="$(v4l2-ctl --list-devices 2>/dev/null || true)"
    printf '%s\n' "$v4l2_devices"
    grep -Fq 'rpi-hevc-dec' <<< "$v4l2_devices" &&
        pass "v4l2-ctl enumerates the HEVC decoder" ||
        fail "v4l2-ctl does not enumerate the HEVC decoder"
    grep -Fq 'pispbe' <<< "$v4l2_devices" &&
        pass "v4l2-ctl enumerates PiSP" ||
        fail "v4l2-ctl does not enumerate PiSP"
else
    warn "v4l2-ctl is unavailable; V4L2 enumeration was skipped"
fi

if has_cmd media-ctl; then
    pisp_media_count=0
    hevc_media_count=0
    for media_device in /dev/media*; do
        [[ -c "$media_device" ]] || continue
        if ! topology="$(media-ctl --device="$media_device" --print-topology 2>&1)"; then
            fail "unable to read the topology for $media_device"
            printf '%s\n' "$topology"
            continue
        fi

        if grep -Eq '^driver[[:space:]]+pispbe$' <<< "$topology"; then
            pisp_media_count=$((pisp_media_count + 1))
            for entity in \
                pispbe-input \
                pispbe-output0 \
                pispbe-output1 \
                pispbe-config; do
                grep -Fq "$entity" <<< "$topology" ||
                    fail "$media_device is missing the $entity entity"
            done
        elif grep -Eq '^driver[[:space:]]+rpi-hevc-dec$' <<< "$topology"; then
            hevc_media_count=$((hevc_media_count + 1))
            for entity in \
                rpi-hevc-dec-source \
                rpi-hevc-dec-proc \
                rpi-hevc-dec-sink; do
                grep -Fq "$entity" <<< "$topology" ||
                    fail "$media_device is missing the $entity entity"
            done
        fi
    done

    [[ "$pisp_media_count" == "2" ]] &&
        pass "two complete PiSP media-controller graphs are registered" ||
        fail "expected two PiSP media controllers, found $pisp_media_count"
    [[ "$hevc_media_count" == "1" ]] &&
        pass "one complete HEVC media-controller graph is registered" ||
        fail "expected one HEVC media controller, found $hevc_media_count"
else
    warn "media-ctl is unavailable; media-controller topology checks were skipped"
fi

if grep -q '^rp1_cfe ' /proc/modules || grep -q '^rp1_cfe_downstream ' /proc/modules; then
    pass "RP1 camera front-end driver is loaded"
else
    warn "RP1 CFE is packaged but idle; camera capture requires a connected sensor and its overlay"
fi

section "system health"
failed_units="$(systemctl --failed --no-legend --plain 2>/dev/null || true)"
if [[ -z "$failed_units" ]]; then
    pass "systemd has no failed units"
else
    fail "systemd has failed units"
    printf '%s\n' "$failed_units"
fi

kernel_faults="$(grep -Ei \
    'kernel panic|BUG:|Oops:|Call Trace:|EXT4-fs error|I/O error|segfault|general protection fault' \
    <<< "$kernel_log" || true)"
if [[ -z "$kernel_faults" ]]; then
    pass "no serious kernel faults were found"
else
    fail "serious kernel messages were found"
    printf '%s\n' "$kernel_faults"
fi

perf_throttle_count="$(grep -Ec 'perf: interrupt took too long.*lowering kernel[.]perf_event_max_sample_rate' <<< "$kernel_log" || true)"
wifi_power_save_count="$(grep -Fc 'brcmf_cfg80211_set_power_mgmt: power save enabled' <<< "$kernel_log" || true)"
printf 'INFO: perf sampling was automatically throttled %s time(s)\n' "$perf_throttle_count"
printf 'INFO: Wi-Fi power saving was enabled %s time(s)\n' "$wifi_power_save_count"

section "result"
printf 'failures: %d\n' "$failures"
printf 'warnings: %d\n' "$warnings"
printf 'Pi 4 regression: run its smoke test on Raspberry Pi 4 hardware.\n'

(( failures == 0 ))
