#!/bin/sh

chosen=$(echo "No\nYes" | dmenu -i -b -p "Are you sure you want to reboot?")

if [ $chosen = "Yes" ]
then
	reboot
fi
