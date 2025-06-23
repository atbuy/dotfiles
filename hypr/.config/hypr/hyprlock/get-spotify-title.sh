#!/bin/zsh

echo "<span>$(playerctl --player='spotify' metadata --format='{{ artist }}     {{ title }}')</span>"
