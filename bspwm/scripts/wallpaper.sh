#!/bin/sh

WPP=`ls ~/Pictures/Wallpapers/`

WALLPAPERS=""

for entry in "$WPP"
do
	WALLPAPERS="$entry"
done

CHOSEN=$(sh $HOME/.config/bspwm/scripts/dmenu_config.sh "$WALLPAPERS")

feh --bg-fill "$HOME/Pictures/Wallpapers/$CHOSEN"

