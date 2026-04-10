#!/usr/bin/env bash

set -euo pipefail

THEME_DIR="${HOME}/.config/i3/themes"
LINK_PATH="${HOME}/.config/i3/current-theme.conf"

if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename "$0") <theme-name>"
  echo
  echo "Available themes:"
  find "$THEME_DIR" -maxdepth 1 -type f -name '*.conf' -printf '%f\n' | sed 's/\.conf$//' | sort
  exit 1
fi

theme="$1"
target="${THEME_DIR}/${theme}.conf"

if [[ ! -f "$target" ]]; then
  echo "Theme not found: $theme"
  echo
  echo "Available themes:"
  find "$THEME_DIR" -maxdepth 1 -type f -name '*.conf' -printf '%f\n' | sed 's/\.conf$//' | sort
  exit 1
fi

ln -sfn "$target" "$LINK_PATH"

if command -v i3-msg >/dev/null 2>&1; then
  i3-msg reload >/dev/null
fi

echo "Switched i3 theme to: $theme"
