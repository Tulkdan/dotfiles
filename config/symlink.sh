#!/bin/bash

dotfilesDir=$(pwd)

function linkConfigFile {
  dest="${HOME}/.config/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

mkdir -p "$HOME/.config/git"
linkConfigFile git/config
linkConfigFile git/message

mkdir -p "$HOME/.config/spotifyd"
linkConfigFile spotifyd/spotifyd.conf

mkdir -p "$HOME/.config/sxhkd"
linkConfigFile sxhkd/sxhkdrc

mkdir -p "$HOME/.config/alacritty"
linkConfigFile alacritty/alacritty.yml

mkdir -p "$HOME/.config/scripts"
for script in $(ls scripts/*.sh); do
  linkConfigFile $script
done

mkdir -p "$HOME/.config/X"
for colorscheme in $(ls X/Xres.*); do
  linkConfigFile $colorscheme
done
