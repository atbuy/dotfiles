#!/bin/zsh

STORED_SONG=`cat ~/.config/hypr/hyprlock/current_song_name`
CURRENT_SONG=`playerctl --player="spotify" metadata --format="{{ artist }} - {{ title }}"`

# Return wallpaper image in case no spotify song is playing
if [[ $? == 1 ]]; then
  echo "$HOME/.config/backgrounds/wallpaper.jpg"
  exit
fi

# If a spotify song is play, check if it's art cover has been downloaded
if [[ $STORED_SONG == $CURRENT_SONG ]]; then
  echo "$HOME/.config/hypr/hyprlock/current-song-cover.jpg"
  exit
fi

# Update current song so that the image won't be downloaded again
echo -n "$CURRENT_SONG" > ~/.config/hypr/hyprlock/current_song_name

# Get song's cover art URL from playerctl
URL=`playerctl metadata | grep artUrl | awk '{ print $3 }'`

# Log when we download something just for debugging
# This file might required some cleanup from time to time, depending on lock screen usage
echo "[$(echo `date '+%Y-%m-%d %H:%M:%S'`)] Downloading song cover for '$CURRENT_SONG'" >> ~/.config/hypr/hyprlock/get-art-url.log

# Download cover art
curl -s -o ~/.config/hypr/hyprlock/current-song-cover.jpg "$URL"

echo "$HOME/.config/hypr/hyprlock/current-song-cover.jpg"
