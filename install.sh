#!/bin/bash

set -xe

sudo apt update
sudo apt upgrade -y

sudo apt install -y git wget curl stow unzip ripgrep build-essential zsh tmux

sudo apt autoremove -y

chsh -s $(which zsh)

mkdir -p "$HOME/.config"

stow git
stow nvim
stow nvm
stow tmux
stow zsh
