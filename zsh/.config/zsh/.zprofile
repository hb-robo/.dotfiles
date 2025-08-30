# Homebrew environment
eval "$(/usr/local/bin/brew shellenv)"
export HOMEBREW_NO_ANALYTICS=1

# Terminal settings
export CLICOLOR=1
export TERM=xterm-256color

# Application XDG compliance
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PIPX_BIN_DIR="$XDG_DATA_HOME/pipx/bin"

# Better less behavior
export LESS='-R --use-color -Dd+r$Du+b$'

# Application paths
export PATH="$HOME/.local/share/nvim/bin:$PATH"
export PATH="$PIPX_BIN_DIR:$PATH"

# Deduplicate PATH
export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':')
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

