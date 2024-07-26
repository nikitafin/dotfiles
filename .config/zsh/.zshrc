## XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# ZSH
export ZSH="$ZDOTDIR/ohmyzsh"
export HISTFILE="$ZDOTDIR"/history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory

ZSH_CUSTOM_PLUG="$ZSH/custom/plugins"

ZSH_THEME="lambda"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 1

if [[ ! -d "$ZSH_CUSTOM_PLUG"/ls ]];then
    git clone https://github.com/zpm-zsh/ls.git "$ZSH_CUSTOM_PLUG"/ls
fi

plugins=(git ls colored-man-pages git-commit history rust golang)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$PATH:/home/nikitafin/.local/share/JetBrains/Toolbox/scripts"

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export OMNISHARPHOME="$XDG_CONFIG_HOME"/omnisharp

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GOPATH="$XDG_DATA_HOME"/go
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

. "$XDG_DATA_HOME/cargo/env"

# aliases
alias l='ls -lAFhv --color=auto'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
