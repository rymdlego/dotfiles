## My dotfiles for MacOS

Prereq: Have *Homebrew* installed.

```
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
```

Then we do things with the *make*.

`make install` will install Xcode package, all Brewfile packages, and stow all dotfiles into place, and some additional post-commands to set things up.

`make stow` will do the dotfiles stowing only.

`make brew` will do the package installing only.
