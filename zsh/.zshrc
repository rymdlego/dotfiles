# HISTORY
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS

# VARS
export EDITOR="zed --wait"
export GIT_EDITOR="zed --wait"
export MANPAGER="less -X" # don’t clear the screen after quitting a manual page

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
autoload -Uz compinit && compinit

# AZURE CLI
if type az &>/dev/null; then
  autoload bashcompinit && bashcompinit
  source $(brew --prefix)/etc/bash_completion.d/az
fi

# TERRAFORM
if type terraform &>/dev/null; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $(brew --prefix)/bin/terraform terraform
fi

# KUBECTL
if type kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# SOURCE FILES
[ -f "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -f "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -f "$HOME/.zsh/fzf.zsh" ] && source "$HOME/.zsh/fzf.zsh"

# DIRENV
if command -v direnv >/dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi
