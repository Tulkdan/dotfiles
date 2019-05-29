#!/bin/sh

choices="laptop\nlaptopdual\nHDMI"

chosen=$(echo "$choices" | dmenu -i -b -nb '#101010' -sf '#404040' -sb '#dddddd' -nf '#dddddd')

case "$chosen" in
				laptop) xrandr --output LVDS-1 --primary --mode 1366x768 --auto --output VGA-1 --off;;
				laptopdual) xrandr --output LVDS-1 --primary --mode 1366x768 --output VGA-1 --auto --right-of LVDS-1;;
				HDMI) xrandr --output LVDS-1 --primary --mode 1366x768 --output HDMI-1 --auto --right-of LVDS-1 ;;
esac

bash $HOME/.config/bspwm/scripts/polybar-5.sh

