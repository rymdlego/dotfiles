PACKAGES = commands ghostty glow starship zed zsh
DEVOPS_PACKAGES = k9s yamlfmt
STOW = stow --no-folding --verbose --target=$$HOME

install: brew stow

brew:
	brew bundle

stow:
	$(STOW) --restow $(PACKAGES)

devops:
	brew bundle --file Brewfile_devops
	$(STOW) --restow $(DEVOPS_PACKAGES)

tmux:
	$(STOW) --restow tmux
	./tmux_setup.sh

unstow:
	$(STOW) --delete $(PACKAGES) $(DEVOPS_PACKAGES) tmux

.PHONY: install brew stow devops tmux unstow
