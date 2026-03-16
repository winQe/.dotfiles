# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Temporary to force me to learn nvim
alias nano='nvim'

# VI Mode!!!
set -o vi
bindkey jk vi-cmd-mode

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

# Git aliases
alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gsw="git switch"
alias gb="git branch"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --oneline --graph"
alias gst="git stash"
alias gstp="git stash pop"
alias gcp="git cherry-pick"
alias grb="git rebase"

export GIT_EDITOR=nvim
export EDITOR=nvim
export VISUAL=$EDITOR

bindkey '^X^E' edit-command-line

export PATH="/opt/homebrew/opt/git/bin:$PATH"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
