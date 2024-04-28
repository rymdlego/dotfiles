# PATHS
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# HOMEBREW
if type brew &>/dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
