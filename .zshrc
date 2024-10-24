# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export VTD_ROOT=$HOME/VIRES/VTD.2021

## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/avt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
   eval "$__conda_setup"
else
   if [ -f "/home/avt/anaconda3/etc/profile.d/conda.sh" ]; then
       . "/home/avt/anaconda3/etc/profile.d/conda.sh"
   else
       export PATH="/home/avt/anaconda3/bin:$PATH"
   fi
fi
unset __conda_setup

#alias python3='/usr/bin/python3'
export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/avt/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Temporary to force me to learn nvim
alias nano='nvim'
alias vim='nvim' 

# VI Mode!!!
set -o vi
bindkey jk vi-cmd-mode

# Created by `pipx` on 2024-05-17 08:45:12
export PATH="$PATH:/home/avt/.local/bin"

# alias wezterm='flatpak run org.wezfurlong.wezterm'

eval "$(zoxide init --cmd cd zsh)"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source <(fzf --zsh)

# Eza
export LS_COLORS="$(vivid generate catppuccin-mocha)"
alias l="eza -l --icons --git -a -h"
alias lt="eza --tree --level=2 --long --icons --git -h"
alias ls="eza --icons --git"
#
eval "$(starship init zsh)"
# alias cat='bat'
source "$HOME/.cargo/env"

# Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

export GIT_EDITOR=nvim

export PATH="/opt/homebrew/opt/git/bin:$PATH"
