#!/bin/sh

chosen=$(sh $HOME/.config/bspwm/scripts/dmenu_config.sh "No\nYes" "Are you sure?")

if [ $chosen = "Yes" ]
then
	reboot
fi
