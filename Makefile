#!make

SHELL := /bin/bash
MAKEFLAGS += --silent

install:
		chmod +x scripts/symlink.sh
		bash scripts/symlink.sh
		chmod +x scripts/symlinkConfigFile.sh
		bash scripts/symlinkConfigFile.sh
		echo "Setup is done, you can use normally"

