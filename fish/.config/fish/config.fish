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
set -x fish_color_param normal
set -x fish_color_operator normal
set -x EZA_COLORS bu=0:ex=31:\*.\*=0:uu=0:gu=0:ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:da=0:sn=0
set -x EDITOR nvim
set -x BAT_THEME "GitHub-Dark-Dimmed"
set -x NOTES_PATH "$HOME/notes"
set -x NOTES_DAILIES "Dailies"
set -x TERM xterm-256color
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux FZF_DEFAULT_OPTS "\
  --color=fg:#adbac7,fg+:#bdcad7,hl:#539bf5,pointer:#539bf5 \
  --color=bg+:#30353c,prompt:#545d68,hl+:#6cb6ff,info:#545d68 \
  --multi"

# set -x FZF_DEFAULT_OPTS "\
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
# --color=selected-bg:#51576d \
# --multi"

# Greeting
set -g fish_greeting

function fish_greeting
    fastfetch --logo none
end


# SSH Agent
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -x SSH_AGENT_PID $SSH_AGENT_PID
end

ssh-keys-add
