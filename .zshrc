# XDG Base 
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME"/oh-my-zsh

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Which plugins would you like to load?
plugins=(git)

# XDB Ninja (must be upper source $ZSH/oh-my-zsh.sh)
export ZDOTDIR="$HOME"/.config/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export WAKATIME_HOME='$XDG_CONFIG_HOME/wakatime'
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

source $ZSH/oh-my-zsh.sh

# User configuration
#
export EDITOR='mvim'

# Go
#
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$XDG_DATA_HOME/go/bin
export PATH=$PATH:/home/nikitafin/shared/lua-language-server/bin

# Aliases
#
alias cls="clear"


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

eval "$(antidot init)"
