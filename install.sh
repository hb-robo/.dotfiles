#!/bin/bash
cd "$(dirname "$0")"

echo -e "Deploying dotfiles with GNU stow..."
stow zsh git starship tmux alacritty

echo "Starting fresh shell..."
exec zsh
