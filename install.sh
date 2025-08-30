#!/bin/bash
cd "$(dirname "$0")"

echo -e "$Deploying dotfiles with GNU stow..."
stow zsh git starship tmux 

echo "Starting fresh shell..."
exec zsh
