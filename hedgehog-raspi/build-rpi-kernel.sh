#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 OUTPUT_DEB" >&2
    exit 2
fi

output_deb="$(realpath -m "$1")"
output_dir="$(dirname "$output_deb")"
build_root="${output_dir}/rpi-kernel"
source_dir="${build_root}/linux"
package_dir="${build_root}/packages"

rpi_kernel_repo="${RPI_KERNEL_REPO:-https://github.com/raspberrypi/linux.git}"
rpi_kernel_ref="${RPI_KERNEL_REF:-rpi-6.18.y}"
rpi_kernel_jobs="${RPI_KERNEL_JOBS:-$(nproc)}"
reuse_packages="${RPI_KERNEL_REUSE_PACKAGES:-0}"

required_commands=(
    bc bison dpkg-buildpackage dpkg-deb dtc flex git make rsync
)

for command_name in "${required_commands[@]}"; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
        echo "Missing Raspberry Pi kernel build command: $command_name" >&2
        exit 1
    fi
done

mkdir -p "$output_dir" "$build_root"

if [[ "$reuse_packages" == "1" ]]; then
    if [[ ! -d "$package_dir" ]]; then
        echo "No completed kernel packages found in $package_dir" >&2
        exit 1
    fi
else
    rm -rf "$source_dir" "$package_dir"
    mkdir -p "$package_dir"

    git clone --depth=1 --branch "$rpi_kernel_ref" "$rpi_kernel_repo" "$source_dir"

    pushd "$source_dir" >/dev/null

    make bcm2712_defconfig

    # Give the package a distinct release and guarantee the drivers used by the
    # Pi 5 temperature sensor, RP1 PWM controller, and four-pin fan connector.
    scripts/config --set-str LOCALVERSION "-hedgehog-rpi"
    scripts/config --disable LOCALVERSION_AUTO
    scripts/config --module BCM2711_THERMAL
    scripts/config --module SENSORS_PWM_FAN
    scripts/config --module PWM_RP1
    make olddefconfig

    grep -Eq '^CONFIG_THERMAL=y$' .config
    grep -Eq '^CONFIG_BCM2711_THERMAL=(y|m)$' .config
    grep -Eq '^CONFIG_SENSORS_PWM_FAN=(y|m)$' .config
    grep -Eq '^CONFIG_PWM_RP1=(y|m)$' .config

    kernel_version="$(make -s kernelversion)"
    package_version="${kernel_version}-1hedgehog1"

    make -j"$rpi_kernel_jobs" bindeb-pkg KDEB_PKGVERSION="$package_version"

    popd >/dev/null

    find "$build_root" -maxdepth 1 -type f -name '*.deb' -exec mv -t "$package_dir" {} +
fi

mapfile -t image_debs < <(
    find "$package_dir" -maxdepth 1 -type f \
        -name 'linux-image-*_*.deb' \
        ! -name '*-dbg_*' \
        -print
)

if [[ ${#image_debs[@]} -ne 1 ]]; then
    echo "Expected one linux-image package; found ${#image_debs[@]}" >&2
    printf '%s\n' "${image_debs[@]}" >&2
    exit 1
fi

image_deb="${image_debs[0]}"
package_name="$(dpkg-deb -f "$image_deb" Package)"

if [[ "$package_name" != linux-image-* ]]; then
    echo "Unexpected kernel package name: $package_name" >&2
    exit 1
fi

kernel_release="${package_name#linux-image-}"

package_listing="$(dpkg-deb -c "$image_deb")"

package_root="$(mktemp -d -p "$build_root" package-check.XXXXXX)"
trap 'rm -rf "$package_root"' EXIT
dpkg-deb -x "$image_deb" "$package_root"

require_package_entry() {
    local entry="$1"
    if ! grep -Fq -- "$entry" <<<"$package_listing"; then
        echo "Kernel package is missing required entry: $entry" >&2
        exit 1
    fi
}

require_package_entry "usr/lib/linux-image-${kernel_release}/broadcom/bcm2712-d-rpi-5-b.dtb"
require_package_entry "/bcm2711_thermal.ko"
require_package_entry "/pwm-fan.ko"
require_package_entry "/pwm-rp1.ko"

require_kernel_driver() {
    local module_file="$1"
    local module_file_alt
    local modules_dir="$package_root/lib/modules/$kernel_release"

    if [[ "$module_file" == *-* ]]; then
        module_file_alt="${module_file//-/_}"
    else
        module_file_alt="${module_file//_/-}"
    fi

    if find "$modules_dir" -type f \
        \( -name "${module_file}.ko" -o -name "${module_file}.ko.*" \
           -o -name "${module_file_alt}.ko" -o -name "${module_file_alt}.ko.*" \) \
        -print -quit | grep -q .; then
        return
    fi

    if [[ -f "$modules_dir/modules.builtin" ]] &&
        grep -Eq "/(${module_file}|${module_file_alt})[.]ko$" \
            "$modules_dir/modules.builtin"; then
        return
    fi

    echo "Kernel package has neither modular nor built-in driver: $module_file" >&2
    exit 1
}

# The downstream bcm2712_defconfig uses the RP1 MFD driver. Its Pi 5 PCIe,
# RP1, and USB-root path is built into Image and recorded in modules.builtin.
require_kernel_driver "irq-bcm2712-mip"
require_kernel_driver "pcie-brcmstb"
require_kernel_driver "rp1"
require_kernel_driver "xhci-hcd"
require_kernel_driver "xhci-pci"
require_kernel_driver "xhci-plat-hcd"
require_kernel_driver "usb-storage"
require_kernel_driver "uas"

dtb_path="$package_root/usr/lib/linux-image-${kernel_release}/broadcom/bcm2712-d-rpi-5-b.dtb"
dts_path="$package_root/bcm2712-d-rpi-5-b.dts"
if ! dtc -I dtb -O dts "$dtb_path" >"$dts_path" 2>/dev/null; then
    echo "Unable to decompile required device tree: $dtb_path" >&2
    exit 1
fi

require_dts_entry() {
    local entry="$1"
    if ! grep -Fq -- "$entry" "$dts_path"; then
        echo "Pi 5 device tree is missing required entry: $entry" >&2
        exit 1
    fi
}

require_dts_entry 'cooling_fan'
require_dts_entry 'compatible = "pwm-fan"'
require_dts_entry 'thermal-zones'

install -m 0644 "$image_deb" "$output_deb"

echo "Built $output_deb ($kernel_release)"
