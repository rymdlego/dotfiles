stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

install:
				stow --verbose --target=$$HOME --restow */
				brew bundle
				bat cache --build
