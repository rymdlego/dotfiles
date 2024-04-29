# PATHS
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)"
