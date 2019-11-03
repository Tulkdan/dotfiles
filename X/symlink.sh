#!/bin/bash

DIR=$(pwd)

function linkDotfile {
  DEST="${HOME}/.config/${1}"

  if [ -h "$DEST" ]; then
    # Existing symlink
    echo "Removing existing symlink: $DEST"
    rm ${DEST}

  elif [ -f "$DEST" ]; then
    # Existing file
    echo "Backing up existing file: $DEST"
    mv ${DEST}{,.${dateStr}}

  elif [ -d "$DEST" ]; then
    # Existing dir
    echo "Backing up existing die: $DEST"
    mv ${DEST}{,.${dateStr}}
  fi

  echo "Creating new symlink: $DEST"
  ln -s "${DIR}/${1}" $DEST
}

for colorscheme in $(ls X/Xres.*); do
  linkDotfile $colorscheme
done
