#!/bin/bash

# Directory containing the CSS themes
THEMES_DIR="$HOME/.config/waybar/themes"

# Target file
STYLE_FILE="$HOME/.config/waybar/style.css"

# Check if the themes directory exists
if [[ ! -d "$THEMES_DIR" ]]; then
    echo "The directory $THEMES_DIR does not exist."
    exit 1
fi

# Check if the style.css file exists
if [[ ! -f "$STYLE_FILE" ]]; then
    echo "The file $STYLE_FILE does not exist."
    exit 1
fi

# List only CSS files in the current directory
files=$(find "$THEMES_DIR" -maxdepth 1 -type f -name "*.css")

# Check if any CSS files exist
if [[ -z "$files" ]]; then
    echo "No CSS files found in $THEMES_DIR."
    exit 1
fi

# Display the files in rofi and select one
selected_file=$(echo "$files" | rofi -dmenu -p "Choose a Waybar theme" -config ~/.config/rofi/window.rasi)

# Check if a file was selected
if [[ -z "$selected_file" ]]; then
    echo "No theme selected."
    exit 1
fi

# Construct the @import line
import_line="@import \"$selected_file\";"

# Replace the last line in style.css
sed -i '$d' "$STYLE_FILE"  # Remove the last line
echo "$import_line" >> "$STYLE_FILE"  # Add the new line

echo "The file $STYLE_FILE has been updated with: $import_line"

# Check if Waybar is running
if pgrep waybar > /dev/null; then
    echo "Waybar is running. Restarting..."
    killall waybar  # Terminate Waybar
    sleep 1  # Small pause to ensure it is properly terminated
fi

# Restart Waybar
echo "Starting Waybar..."
waybar & disown

echo "Waybar has been restarted successfully."
