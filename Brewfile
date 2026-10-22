# Install everything with: brew bundle --file ~/.dotfiles/Brewfile
# Check what's missing with: brew bundle check --verbose --file ~/.dotfiles/Brewfile

# Shell
brew "zsh"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "starship"
brew "zoxide"
brew "fzf"
brew "eza"
brew "vivid"
brew "bat"
brew "fd"
brew "ripgrep"
brew "yazi"
brew "direnv"
brew "stow"

# Editor / terminal multiplexer
brew "neovim"
brew "tree-sitter-cli"
brew "tmux"

# Git
brew "git"
brew "git-delta"
brew "diffnav"
brew "lazygit"
brew "gh"
brew "hub"
brew "worktrunk"

# Languages / build
# Node, Python, Go and Bun versions come from mise (.config/mise/config.toml),
# Rust from rustup, C/C++ from Xcode CLT
brew "mise"
brew "cmake"
brew "gcc"

# AI tooling
brew "skillshare"
brew "terminal-notifier" if OS.mac? # Claude Code notification hook

# Media / docs (used by agent skills)
brew "ffmpeg"
brew "imagemagick"
brew "ghostscript"
brew "poppler"
brew "yt-dlp"

# Linux clipboard (tmux yank)
brew "xclip" if OS.linux?
brew "xsel" if OS.linux?

# Apps
if OS.mac?
  cask "ghostty"
  cask "font-jetbrains-mono-nerd-font"
  cask "codex"
  cask "espanso"
end
