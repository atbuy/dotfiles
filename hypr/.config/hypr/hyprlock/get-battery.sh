#!/bin/bash

# Return battery percentage
echo `upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{ print $2 }'`

