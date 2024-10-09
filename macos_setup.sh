#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
  echo "macOS deteted."

  # Install Xcode
  if xcode-select -p &>/dev/null; then
    echo "Xcode is already installed."
  else
    xcode-select --install
  fi

  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2.0
fi
