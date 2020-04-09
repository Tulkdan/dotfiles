#!/bin/bash
WALL_DIR="$HOME/Pictures/Wallpapers"

FILES=($WALL_DIR/*)
PICT=`printf "%s\n" "${FILES[RANDOM % $[RANDOM % ${#FILES[@]}]]}"`

wal -i $PICT

