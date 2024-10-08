#!/bin/sh

# Define the plugins directory
PLUGIN_DIR="$HOME/.config/tmux/plugins"
TPM_DIR="$PLUGIN_DIR/tpm"

# Create the plugins directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# Clone the TPM repository if it's not already cloned
if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  echo "TPM cloned successfully."
else
  echo "TPM is already installed."
fi

# Display the plugin installation message
echo "Use prefix-I in tmux to install plugins."
