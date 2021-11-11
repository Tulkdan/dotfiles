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
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .bash_aliases
linkDotfile .bash_aws_aliases
mkdir -p .config/git
linkDotfile config/git/config
linkDotfile config/git/message
mkdir -p .config/vim
linkDotfile config/vim/aliases.vim
linkDotfile config/vim/bundles.vim
linkDotfile .vimrc
linkDotfile .xinitrc
linkDotfile .Xresources
linkDotfile .zshrc
