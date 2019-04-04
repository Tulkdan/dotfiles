#!/bin/sh

WPP=`ls ~/Pictures/Wallpapers/`

WALLPAPERS=""

for entry in "$WPP"
do
	WALLPAPERS="$entry\n"
done

CHOSEN=$(echo "$WALLPAPERS" | rofi -dmenu -i -p Wallpapers -width 50)

echo "${CHOSEN}"

feh --bg-fill "$HOME/Pictures/Wallpapers/$CHOSEN"

