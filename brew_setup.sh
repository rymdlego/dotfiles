#!/bin/bash

if command -v brew &>/dev/null; then
  echo "Homebrew is already installed."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

LINUX_BREW_PATH="/home/linuxbrew/.linuxbrew/bin"
MACOS_BREW_PATH="/opt/homebrew/bin"

if [ -d "$LINUX_BREW_PATH" ]; then
  export BREW_BIN_PATH=$LINUX_BREW_PATH
else
  export BREW_BIN_PATH=$MACOS_BREW_PATH
fi
