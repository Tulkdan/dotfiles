#!/bin/bash

OUTPUTS=""

while read -r line
do
  OUTPUTS+="$line\n"
done < <(pacmd list-cards | grep output: | awk '{ print $1, $2, $3, $4 }')

CHOSEN=$(sh $HOME/.config/scripts/dmenu_config.sh "$OUTPUTS")

if [ -n "$CHOSEN" ]
then
  CHOSEN=$(echo "${CHOSEN}" | awk '{ print $1 }')

  pacmd set-card-profile 0 "${CHOSEN::-1}"

  notify-send -t 1500 "Audio output changed" "${CHOSEN::-1}"
fi

