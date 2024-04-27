stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

install:
				xcode-select --install
				brew bundle
				stow --verbose --target=$$HOME --restow */
				bat cache --build
				git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
