#!/usr/bin/env bash
# Set up a new machine from these dotfiles. Safe to re-run: every step skips if already done.
set -euo pipefail

DOTFILES="$HOME/.dotfiles"
step() { printf '\n\033[1;35m==> %s\033[0m\n' "$*"; }
has() { command -v "$1" >/dev/null 2>&1; }

step "Homebrew"
if ! has brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

step "Brew packages (Brewfile)"
brew bundle --file "$DOTFILES/Brewfile"

step "Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

step "Rust"
[ -f "$HOME/.cargo/env" ] || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

step "Atuin"
[ -f "$HOME/.atuin/bin/env" ] || curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

step "Claude Code"
has claude || curl -fsSL https://claude.ai/install.sh | bash

step "Stow dotfiles"
cd "$DOTFILES"
stow --adopt .
git restore . # --adopt pulls existing files into the repo; throw those changes away

step "tmux plugins (tpm)"
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" || true

step "gh extensions"
if gh auth status >/dev/null 2>&1; then
  gh extension list | grep -q gh-dash || gh extension install dlvhdr/gh-dash
else
  echo "skipped: run 'gh auth login' then re-run this script"
fi

step "Skillshare"
skillshare sync || echo "skipped: skillshare sync failed (skills repo not cloned yet?)"

step "Done"
cat <<'EOF'
Manual follow-ups:
  - gh auth login        (then re-run for gh-dash)
  - atuin login
  - chsh -s "$(which zsh)" if zsh isn't your login shell
  - open tmux and press prefix + I if plugins didn't install
EOF
