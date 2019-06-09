#!/bin/bash

VALUE=""

# background color of non selected
COLOR_NB="#35246C"
# font color of non selected
COLOR_NF="#DDDDDD"
# font color of selected
COLOR_SF="#35246C"
# background of selected
COLOR_SB="#DDDDDD"

if [ "$2" ]
then
  VALUE=$(printf "$1" | dmenu -i -nb "$COLOR_NB" -sf "$COLOR_SF" -sb "$COLOR_SB" -nf "$COLOR_NF" -p "$2")
else
  VALUE=$(printf "$1" | dmenu -i -nb "$COLOR_NB" -sf "$COLOR_SF" -sb "$COLOR_SB" -nf "$COLOR_NF" )
fi


echo "$VALUE"
