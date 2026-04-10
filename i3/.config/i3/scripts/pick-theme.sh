#!/usr/bin/env bash
set -euo pipefail

theme="$(
  find "$HOME/.config/i3/themes" -maxdepth 1 -type f -name "*.conf" -printf "%f\n" \
    | sed 's/\.conf$//' \
    | sort \
    | rofi -dmenu -p "i3 theme"
)"

if [[ -n "$theme" ]]; then
  "$HOME/.config/i3/scripts/switch-theme.sh" "$theme"
fi
