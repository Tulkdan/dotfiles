#!/bin/sh

chosen=$(echo "No\nYes" | dmenu -i -b -p "Are you sure you want to shutdown?")

if [ $chosen = "Yes" ]
then
	shutdown now
fi
