#!/bin/sh

# merge in defaults and keymaps
xrdb $HOME/.Xresources

./$HOME/.config/bar/panel
sxhkd &
bspwm
