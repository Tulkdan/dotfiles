#!/bin/sh

WPP=`ls ~/Pictures/Wallpapers/`

WALLPAPERS=""

for entry in "$WPP"
do
	WALLPAPERS="$entry"
done

CHOSEN=$(echo "$WALLPAPERS" | dmenu -i -nb '#101010' -sf '#404040' -sb '#dddddd' -nf '#dddddd')

echo "${CHOSEN}"

feh --bg-fill "$HOME/Pictures/Wallpapers/$CHOSEN"

