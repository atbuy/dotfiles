#!/usr/bin/env bash

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 0.2
done

primary="HDMI-1"

while IFS= read -r line; do
  monitor="${line%%:*}"

  if [[ "$monitor" == "$primary" ]]; then
    MONITOR="$monitor" \
    POLYBAR_CENTER="" \
    POLYBAR_RIGHT="wlan battery date systray" \
    polybar -c "$HOME/.config/polybar/config.ini" --reload toph &
  else
    MONITOR="$monitor" \
    POLYBAR_CENTER="" \
    POLYBAR_RIGHT="battery date" \
    polybar -c "$HOME/.config/polybar/config.ini" --reload toph &
  fi
done < <(polybar --list-monitors)
