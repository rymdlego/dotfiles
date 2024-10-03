# PATHS
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# HOMEBREW
[ -d "/opt/homebrew/bin" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -d "/home/linuxbrew/.linuxbrew/bin" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
