#!/bin/sh

chosen=$(sh $HOME/.config/scripts/dmenu_config.sh "No\nYes" "Are you sure?")

if [ $chosen = "Yes" ]
then
	shutdown now
fi
