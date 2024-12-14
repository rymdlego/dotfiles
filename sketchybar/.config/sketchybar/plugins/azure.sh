#!/bin/sh

subscription="$(jq -r '.subscriptions[] | select(.isDefault == true) | .name' ~/.azure/azureProfile.json 2>/dev/null)"
shortname="$(echo $subscription | sed -n 's/.*(\(.*\)).*/\1/p')"

if [ -n "$subscription" ]; then
  sketchybar --set "$NAME" icon="󰠅" label="$shortname"
else
  sketchybar --set "$NAME" icon="" label=""
fi
