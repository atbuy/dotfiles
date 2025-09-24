#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "HDMI-1" ]; then
      MONITOR=$m polybar --config=$HOME/.config/polybar/config.ini --reload=toph &
    else
      MONITOR=$m polybar --config=$HOME/.config/polybar/config-other.ini --reload=toph &
    fi
  done
else
  polybar --config=$HOME/.config/polybar/config.ini --reload=toph &
fi
