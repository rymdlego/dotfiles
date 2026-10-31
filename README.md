## My dotfiles

Config files only. Installing links them into `$HOME` with GNU Stow; it does not change system settings, your login shell, or how SSH works. Stow refuses to overwrite existing files, so move or merge any conflicting file first.

### Install

1. Install [Homebrew](https://brew.sh).
2. From this repository, run `make install` to install the Brewfile packages and link the config.

| Command       | What it does                                                          |
| ------------- | --------------------------------------------------------------------- |
| `make brew`   | Install the `Brewfile` packages                                       |
| `make stow`   | Link `commands`, `ghostty`, `glow`, `starship`, `zed`, `zsh`          |
| `make devops` | Install `Brewfile_devops` (Kubernetes, Azure, Terraform) and link `k9s`, `yamlfmt` |
| `make tmux`   | Link the tmux config and clone TPM (meant for Linux; not used on macOS) |
| `make unstow` | Remove every link this repository created                             |

### Shell

Zsh with Starship for the prompt. The config doesn't change your login shell; macOS already uses `/bin/zsh`.

Aliases live in `zsh/.zsh/aliases.zsh`. Kubernetes and Azure aliases (`k`, `kc`, `ks`, `kx`, `ax`, `tf`, `kfail`) need `make devops`. Reload aliases with `source ~/.zsh/aliases.zsh`.

Direnv is enabled; review an `.envrc` before running `direnv allow`.

History is stored in `~/.zsh_history` and shared between sessions. `Ctrl+R` searches it with fzf.

### Editing

Zed is the default editor (`zed --wait`), so make sure the `zed` CLI is on your `PATH`. For a one-off terminal editor, run `EDITOR=vi GIT_EDITOR=vi <command>`.

### Optional: Set up multiple Git identities and SSH keys

Create a .gitconfig in home folder that looks something like this

```
[user]
  email = my@email.address
  name = My Name
[init]
  defaultBranch = master
[help]
  autocorrect = 1
[core]
  sshCommand = ssh -i ~/.ssh/mykey
  editor = zed --wait
[includeIf "gitdir:~/other/identity/"]
  path = ~/other/identity/.gitconfig
```

And then add a similar .gitconfig in the dir where you want to override values.
