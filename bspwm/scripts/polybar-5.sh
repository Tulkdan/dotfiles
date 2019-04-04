#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -c $HOME/.config/polybar/polybar-5/config.ini top &

if ( xrandr --query | grep 'VGA-1 connected' ); then
	polybar -c $HOME/.config/polybar/polybar-5/config.ini top_external &
fi
