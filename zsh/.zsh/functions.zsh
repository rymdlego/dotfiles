#!/bin/zsh

ds() {
  date +%Y%m%d
}

iplookup() {
  curl ipinfo.io/"$1"
}

azure_subscription_switcher() {
  subscriptions=$(az account list --query '[].{name:name, id:id}' -o tsv)
  line_count=$(echo "$subscriptions" | wc -l | xargs)
  display_count=$((line_count + 3))
  # selected=$(echo "$subscriptions" | fzf --height="$display_count" --header="Select an Azure subscription" --delimiter='\t' --with-nth=1)
  selected=$(echo "$subscriptions" | fzf --height="$display_count" --header="Select an Azure subscription" --delimiter='\t')

  if [ -n "$selected" ]; then
    subscription_id=$(echo "$selected" | cut -f2)
    subscription_name=$(echo "$selected" | cut -f1)

    az account set --subscription "$subscription_id"

    echo "Switched to subscription \"$subscription_name\"."
  else
    echo "No subscription selected"
  fi
}

kubernetes_context_switcher() {
  contexts=$(kubectl config get-contexts -o name)
  line_count=$(echo "$contexts" | wc -l | xargs)
  display_count=$((line_count + 3))

  selected=$(echo "$contexts" | fzf --height="$display_count" --header="Select a Kubernetes context")

  if [ -n "$selected" ]; then
    context_name=$(echo "$selected")

    kubectl config use-context "$context_name"

  else
    echo "No context selected"
  fi
}

vim_flexible_open() {
  if [ -z "$1" ]; then
    # No parameter provided, use fzf to select a file interactively
    file="$(find . -type f | fzf --height=20 --preview='bat --style=plain --color=always {}')"
    if [ -n "$file" ]; then
      nvim "$file"
    fi
  else
    # Handle when an argument is provided
    lines=$(fzf --filter="$1" --no-sort) # Initial filter attempt with fzf
    line_count="$(echo "$lines" | wc -l | xargs)" # Trim any leading spaces

    if [ -n "$lines" ] && [ "$line_count" -eq 1 ]; then
      # If exactly one match is found, open it
      file="$lines"
      nvim "$file"
    elif [ -n "$lines" ]; then
      # If multiple files are found, allow further selection using fzf and bat for preview
      file=$(echo "$lines" | grep -v '\/$' | fzf --query="$1" --height=20 --preview='bat --style=plain --color=always {}')
      if [ -n "$file" ]; then
        nvim "$file"
      fi
    else
      echo "No matches found." >&2
      return 1 # Return non-zero status to indicate failure
    fi
  fi
}
