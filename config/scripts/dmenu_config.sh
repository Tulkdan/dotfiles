#!/bin/bash

VALUE=""

# Import colors from pywal
. "${HOME}/.cache/wal/colors.sh"

# background color of non selected
# COLOR_NB="#35246C"
COLOR_NB="$background"
# font color of non selected
# COLOR_NF="#DDDDDD"
COLOR_NF="$color6"
# font color of selected
# COLOR_SF="#35246C"
COLOR_SF="$color0"
# background of selected
# COLOR_SB="#DDDDDD"
COLOR_SB="$foreground"

if [ "$2" ]
then
  VALUE=$(printf "$1" | dmenu -i -nb "$COLOR_NB" -sf "$COLOR_SF" -sb "$COLOR_SB" -nf "$COLOR_NF" -p "$2")
else
  VALUE=$(printf "$1" | dmenu -i -nb "$COLOR_NB" -sf "$COLOR_SF" -sb "$COLOR_SB" -nf "$COLOR_NF" )
fi


echo "$VALUE"
