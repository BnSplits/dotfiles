#!/bin/bash
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
function echo_success() { echo -e "${GREEN}✓ $1${NC}"; }
function echo_warning() { echo -e "${YELLOW}⚠ $1${NC}"; }
function echo_error() { echo -e "${RED}✗ $1${NC}\n"; }
function print_separator() {
    echo -e "\n${CYAN}##############################${NC}"
    echo -e "${CYAN}# $1${NC}"
    echo -e "${CYAN}##############################${NC}\n"
}

# Directory where backup files will be stored
BACKUP_DIR="../backup_latest"
mkdir -p "$BACKUP_DIR/home" "$BACKUP_DIR/etc" || { echo_error "Unable to create backup directories"; exit 1; }

# Folders and files to backup
items_to_backup=(
    # Folders in $HOME/.config
    "$HOME/.config/ags/"
    "$HOME/.config/fastfetch/"
    "$HOME/.config/fish/"
    "$HOME/.config/gtk-3.0/"
    "$HOME/.config/gtk-4.0/"
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

    # Files in $HOME/.config
    "$HOME/.config/starship.toml"

    # Folders in $HOME/.cache and other folders
    "$HOME/.cache/wal/"
    "$HOME/.cache/wallpaper"
    "$HOME/.cache/wallpaper-blur"
    "$HOME/.fonts"
    # "$HOME/.zen"

    # Files in $HOME
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.Xresources"

    # Files in /etc
    "/etc/makepkg.conf"
)

print_separator "Backing up files and folders to $BACKUP_DIR"

# Copy files and folders to the backup directory
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
    else
        echo_warning "$item does not exist, skipping backup"
    fi
done
echo_success "Backup completed."
