#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# https://fishshell.com/


# Path
set -x PATH $HOME/.local/bin $PATH


# Homebrew
set linuxbrew_path "/home/linuxbrew/.linuxbrew/bin"

if test -d $linuxbrew_path
    eval ($linuxbrew_path/brew shellenv)
else
    eval (/opt/homebrew/bin/brew shellenv)
end


# Setup
starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'


# vi-mode (hybrid mode)
fish_hybrid_key_bindings


# Environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -x BAT_THEME "Catppuccin-frappe"
set -x NOTES_PATH "$HOME/notes"
set -x NOTES_DAILIES "Dailies"
set -x TERM xterm-256color

# Greeting
set -g fish_greeting

function fish_greeting
    neofetch_cached
end


# SSH Agent
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -x SSH_AGENT_PID $SSH_AGENT_PID
end

ssh-keys-add
