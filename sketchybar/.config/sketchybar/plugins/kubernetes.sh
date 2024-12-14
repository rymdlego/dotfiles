#!/bin/sh

context=$(sed -n 's/^[[:space:]]*current-context:[[:space:]]*//p' ~/.kube/config | xargs)

if [ "$context" != "" ]; then
  sketchybar --set "$NAME" icon="⎈" label="$context"
else
  sketchybar --set "$NAME" icon="" label=""
fi
