# MOTD

if command -v neofetch &> /dev/null; then
    # Define the output file
    OUTPUT_FILE="/tmp/neofetch_output.txt"
    
    # Check if the file exists and is older than 24 hours
    if [ ! -f "$OUTPUT_FILE" ] || [ $(find "$OUTPUT_FILE" -mtime +0 -print) ]; then
        # Run neofetch and redirect output to the file
        neofetch --config $HOME/.config/neofetch/blockfetch.conf --ascii $HOME/.config/neofetch/cup.txt --ascii_colors 1 2 3 4 5 6 > "$OUTPUT_FILE"
    fi
    
    # Display the content of the file
    echo ""
    cat "$OUTPUT_FILE"
fi
