stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

install:
				make brew stow macos-settings
				./fish_setup.sh
				./tmux_setup.sh
				bat cache --build

macos-settings:
				defaults write -g InitialKeyRepeat -int 15
				defaults write -g KeyRepeat -int 2.0

devops:
				brew bundle --file Brewfile_devops

