#!/bin/sh

chosen=$(echo "No\nYes" | dmenu -i -b -p "Are you sure you want to reboot?" -nb '#101010' -sf '#404040' -sb '#dddddd' -nf '#dddddd')

if [ $chosen = "Yes" ]
then
	reboot
fi
