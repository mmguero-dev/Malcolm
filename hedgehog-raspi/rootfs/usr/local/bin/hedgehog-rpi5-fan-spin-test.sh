#!/usr/bin/env bash

set -euo pipefail

if (( EUID != 0 )); then
    printf 'Run this test with sudo: sudo %s\n' "$0" >&2
    exit 1
fi

fan_device=""
for device in /sys/class/thermal/cooling_device*; do
    [[ -d "$device" ]] || continue
    if [[ "$(< "$device/type")" == "pwm-fan" ]]; then
        fan_device="$device"
        break
    fi
done

if [[ -z "$fan_device" ]]; then
    echo "pwm-fan cooling device is missing" >&2
    exit 1
fi

fan_input=""
fan_pwm=""
for hwmon in /sys/class/hwmon/hwmon*; do
    [[ -r "$hwmon/name" ]] || continue
    if [[ "$(< "$hwmon/name")" == "pwmfan" ]]; then
        [[ -r "$hwmon/fan1_input" ]] && fan_input="$hwmon/fan1_input"
        [[ -r "$hwmon/pwm1" ]] && fan_pwm="$hwmon/pwm1"
        break
    fi
done

original_state="$(< "$fan_device/cur_state")"
max_state="$(< "$fan_device/max_state")"

restore_fan() {
    printf '%s\n' "$original_state" > "$fan_device/cur_state"
}
trap restore_fan EXIT INT TERM

temperature="$(< /sys/class/thermal/thermal_zone0/temp)"
awk -v value="$temperature" 'BEGIN { printf "Temperature: %.1f C\n", value / 1000 }'
printf 'Fan device: %s\n' "$fan_device"
printf 'Original state: %s/%s\n' "$original_state" "$max_state"
printf 'Setting state %s for five seconds. Watch and listen for the fan.\n' "$max_state"

printf '%s\n' "$max_state" > "$fan_device/cur_state"
sleep 1
printf 'Reported state: %s/%s\n' "$(< "$fan_device/cur_state")" "$max_state"
[[ -n "$fan_pwm" ]] && printf 'PWM: %s\n' "$(< "$fan_pwm")"
[[ -n "$fan_input" ]] && printf 'RPM: %s\n' "$(< "$fan_input")"
sleep 4

restore_fan
trap - EXIT INT TERM
printf 'Restored state: %s/%s\n' "$(< "$fan_device/cur_state")" "$max_state"
printf 'A reported RPM of zero is expected with fans that do not expose a tachometer signal.\n'
