install:
				./brew_setup.sh
				make brew stow
				./fish_setup.sh
				./tmux_setup.sh
				bat cache --build

brew:
				brew bundle

stow:
				stow --no-folding --verbose --target=$$HOME --restow */

unstow:
				stow --no-folding --verbose --target=$$HOME --delete */

devops:
				brew bundle --file Brewfile_devops
