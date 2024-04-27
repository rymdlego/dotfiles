# PATHS
[ -d "/opt/homebrew/bin" ] && PATH="/opt/homebrew/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin" ] && PATH="$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"

# HISTORY
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"

# PROMPT
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# VARS
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export MANPAGER="less -X" # don’t clear the screen after quitting a manual page
export DOTFILES="$HOME/dotfiles"
export BAT_THEME="Catppuccin-frappe"

# KEYBOARD
bindkey -e # make ctrl-p and other ctrl-commands work
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # make lowercase tab-complete case insensitive

# COMPLETIONS
FPATH=$HOME/.zsh/completions:$FPATH
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
autoload -Uz compinit && compinit

# SOURCE FILES
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.sh
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.sh
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.sh
[ -f ~/.zsh/motd.zsh ] && source ~/.zsh/motd.sh
[ -f ~/.zsh/ssh-agent.zsh ] && source ~/.zsh/ssh-agent.sh

# ZOXIDE
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi
