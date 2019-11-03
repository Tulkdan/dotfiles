#!make

SHELL := /bin/bash
MAKEFLAGS += --silent

install:
		bash scripts/symlink.sh
		bash scripts/symlinkConfigFile.sh
		echo "Setup is done, you can use normally"

Xresources:
		bash X/symlink.sh
		echo "Symlink X themes completed"

