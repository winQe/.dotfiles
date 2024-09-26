# Dotfiles Setup

This repository contains my personal dotfiles and configuration files. This guide will help you set up your environment on a new PC.

## Prerequisites

### Install Homebrew

First, install [Homebrew](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-homebrew-on-linux), the macOS package manager:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Required Packages

Use Homebrew to install the necessary packages:

```sh
brew install zsh ripgrep fzf eza zoxide vivid nvim stow lazygit starship npm git-delta
```

To avoid problem while running tmux + nvim inside docker container, use latest version of tmux
```sh
brew install tmux --HEAD
```

### Install Rust and Cargo
```sh
curl https://sh.rustup.rs -sSf | sh
```

### Install Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Setting up Dotfiles
### Clone the Repository
Clone this repository to your home directory:

### Adopt Existing Configurations
If you already have some configuration files in your home directory that you want to preserve, you can adopt them into your dotfiles repository:

```sh
cd ~/.dotfiles
stow --adopt .
git restore
```

## Tmux Plugins
Clone and install tpm
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Press prefix + I (capital i, as in Install) to fetch the plugin.


## Oh My Zsh Plugins
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/zsh-users/zsh-syntax-highlighting
