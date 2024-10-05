ds() {
  date +%Y%m%d
}

iplookup() {
  curl ipinfo.io/"$1"
}

vim_flexible_open() {
  if [ -z "$1" ]; then
    # No parameter provided, use fzf to select a file interactively
    file="$(__fzf_select)"
    if [ -n "$file" ]; then
      file=$(echo "$file" | sed 's/ *$//') # __fsel adds a space that needs to be removed
      nvim "$file"
    fi
  else
    file="$(fzf_one_or_more_files "$1")"
    if [ -n "$file" ]; then                # Check both success status and non-empty file
      file=$(echo "$file" | sed 's/ *$//') # __fsel adds a space that needs to be removed
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
    echo "$lines" | __fzf_select --query="$1" # Proceed only if there are lines
  else
    echo "No matches found." >&2
    return 1 # Return non-zero status to indicate failure
  fi
}

# Azure subscription switcher
ax() {
  selected=$(az account list --query '[].{name:name, id:id}' -o tsv | fzf --header="Select an Azure subscription" --delimiter='\t' --with-nth=1)

  if [ -n "$selected" ]; then
    subscription_id=$(echo "$selected" | cut -f2)

    az account set --subscription "$subscription_id"

    echo "Switched to subscription: $subscription_id"
  else
    echo "No subscription selected"
  fi
}
