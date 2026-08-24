#!/bin/sh

# Find non-USB fixed-disk candidates. find's -name predicates do the device-type
# filtering (SATA/SAS/IDE sd*/hd*, virtio vd*, Xen xvd*, NVMe nvme*); the sed
# just extracts the symlink name (between the last '/' and ' -> ') rather than
# re-matching device-name patterns, which avoids partial-name mis-captures
# (e.g. 'vda' out of 'xvda', or 'nvme0' out of 'nvme0n1').
NON_USB_DEVICES="$(
  find /sys/block -mindepth 1 -maxdepth 1 -type l \
      \( -name '[hs]d*' -o -name 'vd*' -o -name 'xvd*' -o -name 'nvme*' \) \
      -exec ls -l '{}' ';' |
    grep -v "usb" |
    sed 's@^.*/\([^/ ]*\) -> .*$@/dev/\1@' |
    sed -e :a -e '$!N; s/\n/|/; ta'
)"

if [ -z "$NON_USB_DEVICES" ]; then
  echo "No non-USB installation target found; refusing to select installer media" >&2
  echo "/dev/__malcolm_no_install_target__"
  exit 1
fi

# parted_devices output is tab-separated (device<TAB>size<TAB>model); anchor the
# match on trailing whitespace so /dev/sda cannot also match a /dev/sdab line.
parted_devices |
  egrep "^(${NON_USB_DEVICES})[[:space:]]" |
  sort -k2n |
  head -1 |
  cut -f1
