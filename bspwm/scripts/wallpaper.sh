#!/bin/sh

WPP=`ls ~/Pictures/Wallpapers/`

WALLPAPERS=""

for entry in "$WPP"
do
	WALLPAPERS="$entry\n"
done

CHOSEN=$(echo "$WALLPAPERS" | dmenu -i -b)

wal -i "$HOME/Pictures/Wallpapers/$CHOSEN"
