# useful aliases
alias ll='ls -lAh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'

alias rzsh="source ~/.zshrc"
alias zshconfig="$EDITOR ~/.zshrc"

# Enable colors
autoload -U colors && colors

# Load starship, my zsh prompt of choice
eval "$(starship init zsh)"

# Add nvim to path and deduplicate path segments
export PATH="$HOME/nvim-macos-x86_64/bin:$PATH"
export EDITOR="nvim"
export VISUAL="$EDITOR"

dedupe_path() {
    export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':')
}
dedupe_path

# Load local zshrc containing device-specific and sensitive information
if [ -f "$HOME/.local_zshrc" ]; then
	source "$HOME/.local_zshrc"
fi
