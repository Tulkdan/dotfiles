#!/bin/bash

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
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
    echo "Backing up existing die: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

# Git
linkDotfile .gitconfig
linkDotfile .gitmessage

# Vim
linkDotfile .vimrc
linkDotfile .vimrc.bundles
mkdir -p "$HOME/.vim"
linkDotfile .vim/.skeleton.html
linkDotfile .vim/.skeleton.tex
linkDotfile .vim/.skeleton.py

# Xresources
linkDotfile .Xresources

# zsh bash things
linkDotfile .zshrc
linkDotfile .bash_aliases
linkDotfile .bash_aws_aliases

