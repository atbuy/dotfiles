#!/usr/bin/env bash

set -euo pipefail

theme="${1:?usage: switch-theme.sh <theme>}"

i3_theme="$HOME/.config/i3/themes/$theme.conf"
polybar_theme="$HOME/.config/polybar/themes/$theme.ini"

[[ -f "$i3_theme" ]] || { echo "Missing i3 theme: $theme"; exit 1; }
[[ -f "$polybar_theme" ]] || { echo "Missing polybar theme: $theme"; exit 1; }

ln -sfn "$i3_theme" "$HOME/.config/i3/current-theme.conf"
ln -sfn "$polybar_theme" "$HOME/.config/polybar/colors-current.ini"

i3-msg reload >/dev/null
"$HOME/.config/polybar/launch.sh" >/dev/null 2>&1 &
