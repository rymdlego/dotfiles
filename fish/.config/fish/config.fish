#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# https://fishshell.com/

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

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
