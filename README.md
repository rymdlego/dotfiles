## My dotfiles for MacOS and Linux

I'm updating this all the time... :)

This is what I use and keep my computers in sync with similar config.

To install everything, just run:

`make install` will install Homebrew (and Xcode if MacOS), Brewfile packages, stow dotfiles into place, and some additional post commands.

For convenience:

`make stow` will do the dotfiles stowing only.

`make brew` will do the Brew package installing only.

### Shell

Use macOS's built-in `/bin/zsh`. The installer stows the Zsh configuration but does not change your login shell. If migrating from another shell, run `chsh -s /bin/zsh`, then log out and back in so terminals and editors pick up the change. Tmux uses `/bin/zsh` for new panes.

Starship provides the prompt. No system-information banner runs during shell startup.

#### Zsh shortcuts

Useful Fish shortcuts now live in `zsh/.zsh/aliases.zsh` as ordinary Zsh aliases. Unlike Fish abbreviations, they do not expand on screen as you type; Zsh expands them when parsing a command. No plugins, ZLE abbreviation framework, or new packages are needed. Tool-specific aliases still require the underlying CLI when used.

- **Git:** `g` → `git`, `ga` → `git add`, `gd` → `git diff`, `gl` → `git log`, `gp` → `git pull`, `gs` → `git status`, `gcm` → `git commit -m` (e.g. `gcm "Fix typo"`).
- **Kubernetes/cloud:** `k` → `kubectl`, `ks` → `k9s`, `kc` → `kubecolor`; `kfail` lists pods across namespaces, filtering out lines containing `Running`, `Completed`, or `STATUS`. `kx` keeps the existing `kubernetes_context_switcher` function (underscores), and `ax` keeps `azure_subscription_switcher`.
- **Files:** `cat` → `bat -p` (use `command cat` for standard `cat`), `img` → `chafa`, `la` → `l -la`. Existing `l` keeps its long-format eza options; `ll` remains `ls -la`.
- **Notes:** `n` → `note`, `ng` → `note git`, `todo` → `note show todo`.
- **Networking/Python:** `p` → `ping`, matching the old Fish shortcut; `python` → `python3`.
- **Other:** `tf` → `terraform`; existing `c` → `clear`, `t` → `sesh connect`, and `wanip` are retained. Neovim's `v`/`vi`/`vim` aliases are not restored.

After editing, reload just the aliases in your current Zsh shell without rerunning startup:

```zsh
source "$HOME/.zsh/aliases.zsh"
```

#### Project environments

Direnv is enabled in Zsh. It loads and unloads approved `.envrc` environments as you enter and leave directories. Review an `.envrc` before running `direnv allow`; shell startup never authorizes one automatically.

#### History

Zsh stores command history locally in `~/.zsh_history` and shares it between sessions. Press `Ctrl+R` to search it with fzf. No separate history service or cross-machine sync is needed.

History files can contain sensitive commands; keep them and any migration backups outside this repository.

#### SSH without an agent

SSH uses key files directly and prompts for the passphrase when it needs to unlock an encrypted key. Zsh clears `SSH_AUTH_SOCK` and `SSH_AGENT_PID`; automatic agent startup and key loading are disabled. This also disables use of forwarded agents in these shells.

The `ssh` Stow package installs `~/.ssh/config.d/no-agent.conf`. Put this line at the **top** of `~/.ssh/config`, before any `Host` blocks or other includes:

```sshconfig
Include config.d/no-agent.conf
```

The fragment sets `IdentityAgent none`, `AddKeysToAgent no`, and `UseKeychain no`. Existing host settings remain in `~/.ssh/config`, and Git's key-specific `sshCommand` settings are unchanged. Specify non-default keys with `IdentityFile` or `ssh -i` rather than relying on an agent to offer them.

This does not remove keys or stored Keychain entries, or disable macOS's system agent service; SSH simply does not use them for agent/passphrase caching. Open a new shell to clear inherited agent variables, or run `unset SSH_AUTH_SOCK SSH_AGENT_PID` in an existing shell.

### Removing a package

These dotfiles are live Stow links. Before deleting a package directory, run `stow --no-folding --target="$HOME" --delete <package>` from this repository. Then remove its configuration, installation steps, and Brewfile entry. Uninstall the retired application and clean its application-specific data after preserving any history or recovery files you want to keep.

Switch and verify the login shell before uninstalling the old shell. Removing a Brewfile entry does not uninstall the package; avoid broad `brew bundle cleanup` or `brew autoremove` during incremental cleanup.

### Editing

Zed is the default editor. Shell editor commands use `zed --wait` so tools such as Git wait until the file is closed. Make sure the `zed` CLI is on your `PATH`.

Use `vi` for terminal-only editing, or `EDITOR=vi GIT_EDITOR=vi <command>` for a one-off terminal editor override.

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
