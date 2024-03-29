# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  #export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="half-life"

# export TERM="screen-256color"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
# )

export VISUAL=$(which nvim)
export EDITOR="$VISUAL"

source $ZSH/oh-my-zsh.sh
# source $HOME/.profile

# User configuration
export XDG_CONFIG_HOME=$HOME/.config
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export CARGO_HOME="$XDG_CONFIG_HOME"/cargo
export RUSTUP_HOME="$XDG_CONFIG_HOME"/rustup
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_aws_aliases ]; then
  source ~/.bash_aws_aliases
fi

# Base16 Shell.
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

fpath=(~/.zsh/completion $fpath)
export PATH=~/.local/bin:$PATH
export PATH="$HOME/.config/cargo/bin:$PATH"

# autoload -U promptinit; promptinit

autoload -Uz add-zsh-hook

eval "$(starship init zsh)"

eval "$(direnv hook zsh)"
