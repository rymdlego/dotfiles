#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract token values
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
max=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')

# Calculate current usage
current=$((total_input + total_output))

# Convert to k format
current_k=$((current / 1000))
max_k=$((max / 1000))

# Calculate percentage
if [ "$max" -gt 0 ]; then
  percent=$((current * 100 / max))
else
  percent=0
fi

# Output formatted string
echo "Context: ${current_k}k/${max_k}k ($percent%)"
