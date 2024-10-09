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


  defaults -currentHost write -g "com.apple.keyboard.modifiermapping.0-0-0" -string
(
        {
        HIDKeyboardModifierMappingDst = 30064771300;
        HIDKeyboardModifierMappingSrc = 30064771129;
    },
        {
        HIDKeyboardModifierMappingDst = 30064771299;
        HIDKeyboardModifierMappingSrc = 30064771299;
    },
        {
        HIDKeyboardModifierMappingDst = 30064771303;
        HIDKeyboardModifierMappingSrc = 30064771303;
    },
        {
        HIDKeyboardModifierMappingDst = 30064771302;
        HIDKeyboardModifierMappingSrc = 30064771302;
    },
        {
        HIDKeyboardModifierMappingDst = 30064771298;
        HIDKeyboardModifierMappingSrc = 30064771298;
    }
)
fi
