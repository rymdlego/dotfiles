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


# Environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -x BAT_THEME "Catppuccin-frappe"


# Greeting
set -g fish_greeting

function fish_greeting
    neofetch_cached
end


# SSH Agent
ssh-agent-setup
