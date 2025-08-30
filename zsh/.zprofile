# Homebrew environment
eval "$(/usr/local/bin/brew shellenv)"

# Terminal settings
export CLICOLOR=1
export TERM=xterm-256color

# Application paths
export PATH="$HOME/.local/share/nvim/bin:$PATH"

# Docker XDG compliance
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Python tools
export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PIPX_BIN_DIR="$XDG_DATA_HOME/pipx/bin"
export PATH="$PIPX_BIN_DIR:$PATH"

# Better less behavior
export LESS='-R --use-color -Dd+r$Du+b$'
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

# Homebrew preferences
export HOMEBREW_NO_ANALYTICS=1

# Deduplicate PATH
export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':')
