install:
				./macos_setup.sh
				./brew_setup.sh
				make brew stow
				./fish_setup.sh
				./tmux_setup.sh
				bat cache --build

brew:
				brew bundle

stow:
				stow --verbose --target=$$HOME --restow */

unstow:
				stow --verbose --target=$$HOME --delete */

devops:
				brew bundle --file Brewfile_devops
