#!/bin/bash
LOCATION=~/Pictures/locker.png
scrot $LOCATION
convert $LOCATION -scale 10% -scale 1000% $LOCATION
[[ -f $1 ]] && convert $LOCATION $1 -gravity center -composite -matte $LOCATION
i3lock -i $LOCATION

