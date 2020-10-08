#!/bin/sh
intern=LVDS1
extern=HDMI1

choices="laptop\ndualHDMI\nHDMI"

chosen=$(sh $HOME/.config/scripts/dmenu_config.sh "$choices")

case "$chosen" in
        laptop) xrandr --output "$intern" --primary --mode 1366x768 --auto --output "$extern" --off;;
        dualHDMI) xrandr --output "$intern" --primary --mode 1366x768 --output "$extern" --auto --right-of "$intern" ;;
        HDMI) xrandr --output "$intern" --off --output "$extern" --primary --auto;;
esac

pkill -USR1 -x limepanel
limepanel &
bash $XDG_CONFIG_HOME/bspwm/bspwmrc

