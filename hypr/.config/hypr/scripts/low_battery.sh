#!/bin/bash

while true; do
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" = "Discharging" ] && [ "$BAT" -le 15 ]; then
        notify-send -u critical "Low Battery" \
            "Battery level is ${BAT}%"
        sleep 600  # Don't spam notifications
    else
        sleep 60
    fi
done
