## XDG Ninja
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

## ZSH and OMZ 

# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME"/oh-my-zsh

# History file
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# Set name of the theme to load
ZSH_THEME="half-life" # set by `omz`

# update automatically without asking
zstyle ':omz:update' mode auto    

# How often to auto-update (in days).
zstyle ':omz:update' frequency 1

plugins=(git golang)

source $ZSH/oh-my-zsh.sh

## User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

# HRust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
source "$CARGO_HOME/env"

export PATH="$PATH:$CARGO_HOME/bin"

# Rocker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# Golabg
export GOPATH="$XDG_DATA_HOME"/go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

# Other
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export PYTHONSTARTUP="/etc/python/pythonrc"

export PATH="/home/nikitafin/.local/bin:$PATH"
