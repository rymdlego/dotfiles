stow:
				stow --verbose --target=$$HOME --restow */

delete:
				stow --verbose --target=$$HOME --delete */

brew:
				brew bundle

all:
				stow --verbose --target=$$HOME --restow */
				brew bundle
