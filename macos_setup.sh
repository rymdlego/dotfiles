#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
  echo "macOS deteted."

  # Install Xcode
  if xcode-select -p &>/dev/null; then
    echo "Xcode is already installed."
  else
    xcode-select --install
  fi

  # Key Repeat
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2.0

  # Dock autohide
  defaults write com.apple.Dock autohide -bool TRUE

  # Finder folders on top
  defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

  # Finder default view set to List
  defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

  # Disable sound on boot
  sudo nvram SystemAudioVolume=" "

fi
