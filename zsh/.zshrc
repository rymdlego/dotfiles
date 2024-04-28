# HISTORY
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS

# VARS
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export MANPAGER="less -X" # don’t clear the screen after quitting a manual page
export BAT_THEME="Catppuccin-frappe"

# STARSHIP
if type starship >/dev/null; then
	eval "$(starship init zsh)"
fi

# ZOXIDE
if type zoxide &>/dev/null; then
	eval "$(zoxide init zsh)"
fi

# KEYBOARD
bindkey -e                                             # make ctrl-p and other ctrl-commands work
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # make lowercase tab-complete case insensitive

# COMPLETIONS
FPATH=$HOME/.zsh/completions:$FPATH
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
autoload -Uz compinit && compinit

# SOURCE FILES
[ -f "$HOME/.zsh/functions.sh" ] && source "$HOME/.zsh/functions.sh"
[ -f "$HOME/.zsh/aliases.sh" ] && source "$HOME/.zsh/aliases.sh"
[ -f "$HOME/.zsh/fzf.sh" ] && source "$HOME/.zsh/fzf.sh"
[ -f "$HOME/.zsh/motd.sh" ] && source "$HOME/.zsh/motd.sh"
[ -f "$HOME/.zsh/ssh-agent.sh" ] && source "$HOME/.zsh/ssh-agent.sh"
