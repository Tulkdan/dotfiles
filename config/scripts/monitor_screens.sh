#!/bin/sh

choices="laptop\nlaptopdual\nHDMI\nonlyHDMI"

chosen=$(sh $HOME/.config/scripts/dmenu_config.sh "$choices")

case "$chosen" in
        laptop) xrandr --output LVDS-1 --primary --mode 1366x768 --auto --output VGA-1 --off;;
        laptopdual) xrandr --output LVDS-1 --primary --mode 1366x768 --output VGA-1 --auto --right-of LVDS-1;;
        HDMI) xrandr --output LVDS-1 --primary --mode 1366x768 --output HDMI-1 --auto --right-of LVDS-1 ;;
        onlyHDMI) xrandr --output LVDS-1 --off --output HDMI-1 --auto;;
esac

bash $HOME/.config/bspwm/scripts/polybar-5.sh

