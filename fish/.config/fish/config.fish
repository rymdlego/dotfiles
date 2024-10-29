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


# Environment variables
set -x fish_color_param normal
set -x fish_color_operator normal
set -x EZA_COLORS bu=0:ex=31:\*.\*=0:uu=0:gu=0:ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:da=0:sn=0
set -x KUBE_CONFIG_PATH $HOME/.kube/config
set -x EDITOR nvim
set -x BAT_THEME "GitHub-Dark-Dimmed"
set -x NOTES_PATH "$HOME/notes"
set -x NOTES_VIEWER glow
set -x TERM xterm-256color
set -x XDG_CONFIG_HOME "$HOME/.config"
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux FZF_DEFAULT_OPTS "\
  --color=fg:#adbac7,fg+:#bdcad7,hl:#539bf5,pointer:#539bf5 \
  --color=bg+:#30353c,prompt:#545d68,hl+:#6cb6ff,info:#545d68 \
  --multi"


# Golang
set -x PATH $HOME/go/bin $PATH
set -x GOPATH $HOME/go


# Homebrew
set linuxbrew_path "/home/linuxbrew/.linuxbrew/bin"

if test -d $linuxbrew_path
    eval ($linuxbrew_path/brew shellenv)
else
    eval (/opt/homebrew/bin/brew shellenv)
end


# Setup
if type -q starship
    starship init fish | source # https://starship.rs/
end
if type -q zoxide
    zoxide init fish | source # 'ajeetdsouza/zoxide'
end
if type -q note
    note completion fish | source # 'rymdlego/note'
end


# vi-mode (hybrid mode)
fish_hybrid_key_bindings


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
