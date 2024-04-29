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
