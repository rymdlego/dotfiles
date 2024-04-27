stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

install:
				make brew stow
				bat cache --build
				git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
				echo "Use prefix-I in tmux to install plugins."
