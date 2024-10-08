stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

install:
				make brew stow macos-settings
				bat cache --build
				mkdir -p $$HOME/.config/tmux/plugins
				git clone https://github.com/tmux-plugins/tpm $$HOME/.config/tmux/plugins/tpm
				echo "Use prefix-I in tmux to install plugins."

devops:
				brew bundle --file Brewfile_devops

macos-settings:
				defaults write -g InitialKeyRepeat -int 15
				defaults write -g KeyRepeat -int 2.0
