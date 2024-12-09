#!/bin/bash

# Directory containing the Configs
CONFIGS_DIR="$HOME/.config/waybar/configs"

# Target file
CONFIG_FILE="$HOME/.config/waybar/config.jsonc"

# Check if the themes directory exists
if [[ ! -d "$CONFIGS_DIR" ]]; then
    echo "The directory $CONFIGS_DIR does not exist."
    exit 1
fi

# Check if the config.jsonc file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "The file $CONFIG_FILE does not exist."
    exit 1
fi

# List only configs files in the current directory
files=$(find "$CONFIGS_DIR" -maxdepth 1 -type f -name "*.jsonc")

# Check if any CSS files exist
if [[ -z "$files" ]]; then
    echo "No config files found in $CONFIGS_DIR."
    exit 1
fi

# Display the files in rofi and select one
selected_file=$(echo "$files" | rofi -dmenu -p "Choose a Waybar config" -config ~/.config/rofi/window.rasi)

# Check if a file was selected
if [[ -z "$selected_file" ]]; then
    echo "No config selected."
    exit 1
fi

if [[ "$selected_file" == *"minimal.jsonc" ]]; then 
  echo "@import \"/home/bnsplit/.config/waybar/themes/minimalist.css\";" > $HOME/.config/waybar/style.css
else
  echo "@import \"/home/bnsplit/.config/waybar/themes/solid-squared.css\";" > $HOME/.config/waybar/style.css
fi

# Replace the last line in style.css
sed -i '$d' "$CONFIG_FILE"  # Remove the last line
cat $selected_file > "$CONFIG_FILE"  # Add the new line

echo "The file $CONFIG_FILE has been updated with: $import_line"

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
