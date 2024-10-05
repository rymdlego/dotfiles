#!/bin/zsh

ds() {
  date +%Y%m%d
}

iplookup() {
  curl ipinfo.io/"$1"
}

vim_flexible_open() {
  if [ -z "$1" ]; then
    # No parameter provided, use fzf to select a file interactively
    # file="$(__fzf_select)"
    file="$(find . -type f | fzf --height=20 --preview='bat --style=plain --color=always {}')"
    if [ -n "$file" ]; then
      # file=$(echo "$file" | sed 's/ *$//') # __fsel adds a space that needs to be removed
      nvim "$file"
    fi
  else
    file="$(fzf_one_or_more_files "$1")"
    if [ -n "$file" ]; then # Check both success status and non-empty file
      # file=$(echo "$file" | sed 's/ *$//') # __fsel adds a space that needs to be removed
      nvim "$file"
    fi
  fi
}

fzf_one_or_more_files() {
  lines=$(fzf --filter="$1" --no-sort) # Initial filter attempt with fzf
  line_count="$(echo "$lines" | wc -l)"

  if [ -n "$lines" ] && [ "$line_count" -eq 1 ]; then
    echo "$lines"
  elif [ -n "$lines" ]; then
    # echo "$lines" | __fzf_select --query="$1" # Proceed only if there are lines
    echo "$lines" | grep -v '\/$' | fzf --query="$1" --height=20 --preview='bat --style=plain --color=always {}' # Proceed only if there are lines
  else
    echo "No matches found." >&2
    return 1 # Return non-zero status to indicate failure
  fi
}

azure_subscription_switcher() {
  subscriptions=$(az account list --query '[].{name:name, id:id}' -o tsv)
  count=$(echo "$subscriptions" | wc -l | xargs)
  display_count=$((count + 3))
  selected=$(echo "$subscriptions" | fzf --height="$display_count" --header="Select an Azure subscription" --delimiter='\t' --with-nth=1)

  if [ -n "$selected" ]; then
    subscription_id=$(echo "$selected" | cut -f2)

    az account set --subscription "$subscription_id"

    echo "Switched to subscription: $subscription_id"
  else
    echo "No subscription selected"
  fi
}

kubernetes_context_switcher() {
  contexts=$(kubectl config get-contexts -o name)
  count=$(echo "$contexts" | wc -l | xargs)
  display_count=$((count + 3))

  selected=$(echo "$contexts" | fzf --height="$display_count" --header="Select a Kubernetes context")

  if [ -n "$selected" ]; then
    context_name=$(echo "$selected")

    kubectl config use-context "$context_name"

  else
    echo "No context selected"
  fi
}
