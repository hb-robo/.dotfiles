#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing dotfiles...${NC}"

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dst="$2"
    
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$dst")"
    
    # Backup existing file if it exists and isn't a symlink
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo -e "${YELLOW}Backing up existing $dst to $dst.backup${NC}"
        mv "$dst" "$dst.backup"
    fi
    
    # Remove existing symlink
    if [ -L "$dst" ]; then
        rm "$dst"
    fi
    
    # Create symlink
    ln -sf "$src" "$dst"
    echo -e "${GREEN}Linked $src -> $dst${NC}"
}

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Link configs
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
# link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo -e "${GREEN}Done! Restart your shell or run 'source ~/.zshrc'${NC}"
echo -e "${GREEN}For tmux: run 'tmux source-file ~/.tmux.conf' in existing sessions${NC}"
