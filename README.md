# Dotfiles Setup

This repository contains my personal dotfiles and configuration files. This guide will help you set up your environment on a new PC.

## Quick start

```sh
git clone <this-repo> ~/.dotfiles
~/.dotfiles/bootstrap.sh
```

`bootstrap.sh` is idempotent (re-run it any time) and does:

1. Installs Homebrew if missing, then everything in [`Brewfile`](Brewfile) via `brew bundle`
2. Oh My Zsh (zsh-autosuggestions / zsh-syntax-highlighting come from brew)
3. Rust (rustup), Atuin, Claude Code (native installers)
4. `stow --adopt .` + `git restore .` to symlink configs into `$HOME`
5. tpm + tmux plugins
6. `gh-dash` gh extension (needs `gh auth login` first)
7. `skillshare sync`

Then finish by hand: `gh auth login`, `atuin login`, and `chsh -s "$(which zsh)"` if needed.

## Packages

All Homebrew packages and casks live in the [`Brewfile`](Brewfile). When you install something new, add it there.

```sh
brew bundle check --verbose   # what's missing / outdated
brew bundle                   # install / upgrade
brew bundle cleanup           # list installed stuff not in the Brewfile (add --force to remove)
```

Linux (linuxbrew) works with the same Brewfile; casks are skipped and xclip/xsel are added.

## Stow

Files that shouldn't be symlinked into `$HOME` (README, Brewfile, bootstrap.sh...) are listed in `.stow-local-ignore`.

## Skillshare
[skillshare](https://github.com/runkids/skillshare) keeps AI agent skills in one place (`~/.config/skillshare/skills`, its own git repo, ignored here) and syncs them to Claude Code (`~/.claude/skills`) and the universal agents dir (`~/.agents/skills`).

Config is stowed from `.config/skillshare/`, so after `stow .` just sync:
```sh
skillshare sync
```
Useful commands:
```sh
skillshare install <github-repo>   # add skills from GitHub
skillshare list                    # list managed skills
skillshare init --discover         # pick up newly installed AI CLIs
skillshare ui                      # web dashboard
```
Don't import `~/.claude/skills/synced` — that folder holds the claude.ai-managed skills that Claude Code syncs itself.
