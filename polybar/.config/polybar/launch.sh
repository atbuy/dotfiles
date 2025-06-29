#!/bin/bash

killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --config=$HOME/.config/polybar/config.ini --reload=toph &
  done
else
  polybar --config=$HOME/.config/polybar/config.ini --reload=toph &
fi
