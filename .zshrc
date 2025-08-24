export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="~/nvim-macos-x86_64/bin:$PATH"
export EDITOR="nvim"
export VISUAL="$EDITOR"

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

if [ -f "$HOME/.local_zshrc" ]; then
	source "$HOME/.local_zshrc"
fi
eval "$(starship init zsh)"
