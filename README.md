## My dotfiles for MacOS

Prereqs:

- _Xcode command line tools_
- _Homebrew_

```
xcode-select --install
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
```

To install everything, just run:

`make install` will install all Brewfile packages, and stow dotfiles into place, and some additional post commands.

For convenience:

`make stow` will do the dotfiles stowing only.

`make brew` will do the Brew package installing only.

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
  editor = nvim
[includeIf "gitdir:~/other/identity/"]
  path = ~/other/identity/.gitconfig
```

And then add a similar .gitconfig in the dir where you want to override values.
