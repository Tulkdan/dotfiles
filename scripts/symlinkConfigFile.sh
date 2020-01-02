#!/bin/bash

dotfilesDir=$(pwd)

function linkConfigFile {
  dest="${HOME}/.config/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/.config/${1} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing die: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

mkdir -p "$HOME/.config/bspwm"
linkConfigFile bspwm/bspwmrc

mkdir -p "$HOME/.config/bspwm/scripts"
linkConfigFile bspwm/scripts/audio_output.sh
linkConfigFile bspwm/scripts/dmenu_config.sh
linkConfigFile bspwm/scripts/lock.sh
linkConfigFile bspwm/scripts/monitor_screens.sh
linkConfigFile bspwm/scripts/polybar-5.sh
linkConfigFile bspwm/scripts/random_wallpaper.sh
linkConfigFile bspwm/scripts/reboot.sh
linkConfigFile bspwm/scripts/shutdown.sh
linkConfigFile bspwm/scripts/wallpaper.sh

mkdir -p "$HOME/.config/sxhkd"
linkConfigFile sxhkd/sxhkdrc

mkdir -p "$HOME/.config/bar"
linkConfigFile bar/panel
linkConfigFile bar/panel_bar
linkConfigFile bar/panel_colors
