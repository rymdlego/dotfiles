## My dotfiles for MacOS

Prereqs: _xcode command line tools_ and _Homebrew_ installed.

```
xcode-select --install
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
```

Then we do things with the _make_.

`make install` will install all Brewfile packages, and stow dotfiles into place, and some additional post commands.

`make stow` will do the dotfiles stowing only.

`make brew` will do the Brew package installing only.
