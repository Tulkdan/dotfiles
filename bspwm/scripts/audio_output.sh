#!/bin/bash

OUTPUTS=""

while read -r line
do
  OUTPUTS+="$line\n"
done < <(pacmd list-cards | grep output: | awk '{ print $1, $2, $3, $4 }')

CHOSEN=$(printf "$OUTPUTS" | dmenu -i -nb '#101010' -sf '#303030' -sb '#dddddd' -nf '#dddddd')

CHOSEN=$(echo "${CHOSEN}" | awk '{ print $1 }')

if [ -z "$CHOSEN" ]
then
  pacmd set-card-profile 0 "${CHOSEN::-1}"
fi
