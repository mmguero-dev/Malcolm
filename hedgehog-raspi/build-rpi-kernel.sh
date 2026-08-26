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

kernel_release="$(make -s kernelrelease)"
kernel_version="$(make -s kernelversion)"
package_version="${kernel_version}-1hedgehog1"

make -j"$rpi_kernel_jobs" bindeb-pkg KDEB_PKGVERSION="$package_version"

popd >/dev/null

find "$build_root" -maxdepth 1 -type f -name '*.deb' -exec mv -t "$package_dir" {} +

mapfile -t image_debs < <(
    find "$package_dir" -maxdepth 1 -type f \
        -name "linux-image-${kernel_release}_*.deb" \
        ! -name '*-dbg_*' \
        -print
)

if [[ ${#image_debs[@]} -ne 1 ]]; then
    echo "Expected one linux-image package for $kernel_release; found ${#image_debs[@]}" >&2
    printf '%s\n' "${image_debs[@]}" >&2
    exit 1
fi

image_deb="${image_debs[0]}"
package_name="$(dpkg-deb -f "$image_deb" Package)"

if [[ "$package_name" != "linux-image-${kernel_release}" ]]; then
    echo "Unexpected kernel package name: $package_name" >&2
    exit 1
fi

package_listing="$(dpkg-deb -c "$image_deb")"
grep -q "usr/lib/linux-image-${kernel_release}/broadcom/bcm2712-d-rpi-5-b.dtb" <<<"$package_listing"
grep -Eq "lib/modules/${kernel_release}/.*/bcm2711_thermal[.]ko" <<<"$package_listing"
grep -Eq "lib/modules/${kernel_release}/.*/pwm-fan[.]ko" <<<"$package_listing"
grep -Eq "lib/modules/${kernel_release}/.*/pwm-rp1[.]ko" <<<"$package_listing"
grep -Eq "lib/modules/${kernel_release}/.*/irq-bcm2712-mip[.]ko" <<<"$package_listing"
grep -Eq "lib/modules/${kernel_release}/.*/rp1_pci[.]ko" <<<"$package_listing"

dtb_dir="$(mktemp -d -p "$build_root" dtb-check.XXXXXX)"
trap 'rm -rf "$dtb_dir"' EXIT
dpkg-deb -x "$image_deb" "$dtb_dir"
dtc -I dtb -O dts \
    "$dtb_dir/usr/lib/linux-image-${kernel_release}/broadcom/bcm2712-d-rpi-5-b.dtb" \
    >"$dtb_dir/bcm2712-d-rpi-5-b.dts" 2>/dev/null
grep -q 'cooling_fan' "$dtb_dir/bcm2712-d-rpi-5-b.dts"
grep -q 'compatible = "pwm-fan"' "$dtb_dir/bcm2712-d-rpi-5-b.dts"
grep -q 'thermal-zones' "$dtb_dir/bcm2712-d-rpi-5-b.dts"

install -m 0644 "$image_deb" "$output_deb"

echo "Built $output_deb ($kernel_release)"
