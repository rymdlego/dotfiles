stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

install:
				make brew stow
				bat cache --build
				mkdir -p $$HOME/.config/tmux/plugins
				git clone https://github.com/tmux-plugins/tpm $$HOME/.config/tmux/plugins/tpm
				echo "Use prefix-I in tmux to install plugins."

devops:
				brew bundle --file Brewfile_devops
