#!/bin/bash

if command -v fish >/dev/null; then
  echo "Fish shell installed. God is good."
else
  echo "Couldn't find Fish shell. Exiting."
  exit
fi

# Find the path of fish shell
FISH_PATH=$(which fish)

# Check if /etc/shells contains the path to fish
if ! grep -Fxq "$FISH_PATH" /etc/shells; then
  echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
  echo "Fish shell path added to /etc/shells."
else
  echo "Fish shell path is already in /etc/shells."
fi

# Check if the current shell is fish
if [ "$SHELL" != "$FISH_PATH" ]; then
  echo "Changing your shell to fish..."
  chsh -s "$FISH_PATH"
  echo "Shell changed to fish. Please log out and back in for changes to take effect."
else
  echo "Fish shell is already your current shell."
fi
