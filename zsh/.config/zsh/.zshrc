# Prep zsh for XDG compliance
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
mkdir -p "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh"
autoload -U compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# editor configuration
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Load nvm and nvm bash_completion
export NVM_DIR="$XDG_DATA_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# useful aliases
alias c='clear'
alias ll='ls -lAh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'
alias rzsh="exec zsh"
alias zshconfig="$EDITOR $ZDOTDIR/.zshrc"
alias python=python3

# Enable colors
autoload -U colors && colors

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"


if [ -f "$HOME/.local_zshrc" ]; then
	source "$HOME/.local_zshrc"
fi

# Set up interactive shell features
eval "$(starship init zsh)"


