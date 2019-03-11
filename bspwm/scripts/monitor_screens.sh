#!/bin/sh

choices="laptop\nlaptopdual\nHDMI"

chosen=$(echo "$choices" | dmenu -i -b)

case "$chosen" in
				laptop) xrandr --output LVDS-1 --auto --output VGA-1 --off ;;
				laptopdual) xrandr --output LVDS-1 --auto --output VGA-1 --auto --left-of LVDS-1 ;;
				HDMI) xrandr --output LVDS-1 --auto --output HDMI-1 --left-of LVDS-1 ;;
esac
