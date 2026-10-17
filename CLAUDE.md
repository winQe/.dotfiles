# Dotfiles

Personal dotfiles managed with GNU Stow. Symlinked from `~/.dotfiles` to `$HOME`.

## Structure

- `.zshrc` - Zsh config (Oh My Zsh)
- `.config/ghostty/config` - Ghostty terminal config (primary)
- `.wezterm.lua` - WezTerm terminal config (previous)
- `.tmux/tmux.conf` - tmux config (symlinked to `~/.tmux.conf`)
- `.config/nvim/` - Neovim config (NvChad-based)
- `.config/starship.toml` - Starship prompt
- `.config/atuin/` - Atuin shell history
- `.config/lazygit/` - Lazygit
- `.config/mise/` - mise (runtime version manager)
- `.config/worktrunk/` - Worktrunk (git worktree manager)
- `.config/skillshare/` - skillshare (syncs AI agent skills to Claude Code etc.)
- `.config/git/` - Git config
- `.config/gh/` - GitHub CLI
- `.config/fish/` - Fish shell (secondary)
- `.claude/` - Claude Code settings
- `.codex/` - Codex config (`~/.codex` symlinks here; runtime state is gitignored)

## Setup

Uses `stow --adopt .` from `~/.dotfiles` to symlink everything into `$HOME`. See README.md for full setup instructions.

## Key details

- macOS (Darwin), Homebrew for packages
- tmux + Ghostty + Neovim is the primary workflow
- Multiple git worktrees via Worktrunk for GoodNotes work
- Claude Code notification hook uses `terminal-notifier` (must be installed via brew)
- `.claude/settings.json` contains secrets in `env` block -- do not commit without removing them first
