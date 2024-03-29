SYMLINK_CONFIG_FILES := $(PWD)/config/symlink.sh
SYMLINK_DOTFILES := $(PWD)/symlink.sh

main:
	$(SYMLINK_DOTFILES) $(DOTFILES)

config_git:
	mkdir -p "$(HOME)/.config/git"
	$(SYMLINK_CONFIG_FILES) git/config git/message

config_spotifyd:
	mkdir -p "$(HOME)/.config/spotifyd"
	$(SYMLINK_CONFIG_FILES) spotifyd/spotifyd.conf

config_sxhkd:
	mkdir -p "$(HOME)/.config/sxhkd"
	$(SYMLINK_CONFIG_FILES) sxhkd/sxhkdrc

config_emacs:
	mkdir -p "$(HOME)/.emacs.d"
	$(SYMLINK_CONFIG_FILES) emacs/emacs.org emacs/init.el

config_vim: $(wildcard config/vim/*.vim)
	mkdir -p "$(HOME)/.config/vim"
	$(SYMLINK_CONFIG_FILES) $?

config_X_files: $(wildcard config/X/Xres.*)
	mkdir -p "$(HOME)/.config/X"
	$(SYMLINK_CONFIG_FILES) $?

config_scripts: $(wildcard config/scripts/*.sh)
	mkdir -p "$(HOME)/.config/scripts"
	$(SYMLINK_CONFIG_FILES) $?
