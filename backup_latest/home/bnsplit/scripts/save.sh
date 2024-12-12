#!/bin/bash

# Clear the screen
clear

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to display messages with arrows
function echo_arrow() { echo -e "${BLUE}=> $1${NC}"; }
function echo_success() { echo -e "${GREEN}\u2713 $1${NC}"; }
function echo_warning() { echo -e "${YELLOW}\u26A0 $1${NC}"; }
function echo_error() { echo -e "${RED}\u2717 $1${NC}\n"; }
function print_separator() {
    echo -e "\n${CYAN}##############################${NC}"
    echo -e "${CYAN}# $1${NC}"
    echo -e "${CYAN}##############################${NC}\n"
}

# Directory where backup files will be stored
BACKUP_DIR="$HOME/dev/dotfiles/backup_latest"
LOG_FILE="$HOME/dev/dotfiles/backup_log.txt"

# Folders and files to backup
items_to_backup=(
    "$HOME/.config/fastfetch/"
    "$HOME/.config/gtk-3.0/"
    "$HOME/.config/gtk-4.0/"
    "$HOME/.config/qt6ct/"
    "$HOME/.config/hypr/"
    "$HOME/.config/kitty/"
    "$HOME/.config/nvim/"
    "$HOME/.config/rofi/"
    "$HOME/.config/waybar/"
    "$HOME/.config/swaync/"
    "$HOME/.config/waypaper/"
    "$HOME/.config/wlogout/"
    "$HOME/.config/yay/"
    "$HOME/.config/yazi/"
    "$HOME/.config/starship.toml"
    "$HOME/.cache/wal/"
    "$HOME/.cache/wallpaper"
    "$HOME/.cache/wallpaper-blur"
    "$HOME/scripts/"
    # "/mnt/win/Users/USER/Documents/Obsidian/"
    "$HOME/Obsidian/"
    "$HOME/.fonts"
    "$HOME/.zen"
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.Xresources"
    "/etc/makepkg.conf"
)

print_separator "Preparing Backup Process"

# Ensure the backup directory exists and clear its contents
if [ -d "$BACKUP_DIR" ]; then
    echo_arrow "Clearing the backup directory..."
    rm -rf "$BACKUP_DIR"/* || { echo_error "Failed to clear $BACKUP_DIR"; exit 1; }
else
    echo_arrow "Creating the backup directory..."
    mkdir -p "$BACKUP_DIR/home" "$BACKUP_DIR/etc" || { echo_error "Failed to create $BACKUP_DIR"; exit 1; }
fi

# Log the backup start time
echo "Backup started at $(date)" >> "$LOG_FILE"
print_separator "Backing up files and folders to $BACKUP_DIR"

# Copy files and folders to the backup directory
saved_items=()
for item in "${items_to_backup[@]}"; do
    if [ -e "$item" ]; then
        dest="$BACKUP_DIR/${item}"
        dest_dir=$(dirname "$dest")
        mkdir -p "$dest_dir" || { echo_error "Unable to create directory $dest_dir"; exit 1; }

        if [ -d "$item" ]; then
            echo_arrow "Copying directory $item..."
            cp -rT "$item" "$dest" || { echo_error "Error copying $item"; exit 1; }
        else
            echo_arrow "Copying file $item..."
            cp "$item" "$dest" || { echo_error "Error copying $item"; exit 1; }
        fi
        saved_items+=("$item")
    else
        echo_warning "$item does not exist, skipping backup"
    fi
done

# Log the saved items
if [ ${#saved_items[@]} -ne 0 ]; then
    echo "Saved the following items:" >> "$LOG_FILE"
    for saved_item in "${saved_items[@]}"; do
        echo "- $saved_item" >> "$LOG_FILE"
    done
else
    echo "No items were saved during this backup." >> "$LOG_FILE"
fi

# Log the backup completion
echo "Backup completed at $(date)" >> "$LOG_FILE"
echo -e "-------------------------------------------------------------------------------\n" >> "$LOG_FILE"
echo_success "Backup completed."
