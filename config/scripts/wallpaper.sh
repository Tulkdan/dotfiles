#!/bin/sh

WPP=`ls ~/Pictures/Wallpapers/`

WALLPAPERS=""

for entry in "$WPP"
do
	WALLPAPERS="$entry"
done

CHOSEN=$(sh $HOME/.config/scripts/dmenu_config.sh "$WALLPAPERS")

if [ $CHOSEN ]
then
  feh --no-fehbg --bg-fill "$HOME/Pictures/Wallpapers/$CHOSEN"
  wal -s -t -n -e -i "${HOME}/Pictures/Wallpapers/${CHOSEN}"
fi
