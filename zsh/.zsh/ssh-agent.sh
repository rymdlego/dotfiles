#!/bin/sh

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
	echo "'ssh-agent' has not been started since the last reboot. Starting 'ssh-agent' now."
	eval "$(ssh-agent -s)"
	ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# only run if tmux is started
if tmux list-sessions >/dev/null 2>&1; then

	# see if any key files are already added to the ssh-agent, and if not, add them
	if ! ssh-add -l >/dev/null; then
		echo "No ssh keys have been added to your 'ssh-agent' since the last reboot. Adding default keys now."
		for possiblekey in "${HOME}"/.ssh/*; do
			# Check if the item is a directory
			if [ -d "$possiblekey" ]; then
				continue # Skip directories
			fi
			# Skip if sock file
			# if [ "$possiblekey" = "*sock" ]; then
			#     continue
			# fi

			case "$possiblekey" in
			*sock*) continue ;;
			esac

			# For all private keys, set permissions and add
			if grep -q PRIVATE "$possiblekey"; then
				chmod 600 "$possiblekey"
				ssh-add "$possiblekey"
			fi
		done
	fi
fi
