#!/bin/bash
clear

# --- VARIABLES ---

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# --- MESSAGE FUNCTIONS ---

function echo_arrow() { echo -e "${BLUE}=> $1${NC}"; }
function echo_success() { echo -e "${GREEN}✓ $1${NC}"; }
function echo_warning() { echo -e "${YELLOW}⚠ $1${NC}"; }
function echo_error() { echo -e "${RED}✗ $1${NC}\n"; }
function print_separator() {
    echo -e "\n${CYAN}##############################${NC}"
    echo -e "${CYAN}# $1${NC}"
    echo -e "${CYAN}##############################${NC}\n"
}

# List of packages to uninstall
uninstall=(
    "power-profiles-daemon"
    "emacs"
    "gnome-console"
)

# List of packages to install
packages=(
    "amd-ucode"
    "appimagelauncher"
    "bat"
    "bitwarden"
    "btop"
    "cava"
    "cheese"
    "cups"
    "docker"
    "docker-buildx"
    "dolphin"
    "evince"
    "extension-manager"
    "fastfetch"
    "flatpak"
    "fzf"
    "gapless"
    "git"
    "gnome-calendar"
    "gnome-terminal"
    "gnome-text-editor"
    "gnome-weather"
    "google-chrome"
    "hplip"
    "kitty"
    "kdeconnect"
    "libreoffice-still-fr"
    "loupe"
    "neovim"
    "nodejs-lts-iron"
    "npm"
    "onlyoffice-bin"
    "pamac-all"
    "resources"
    "simple-scan"
    "spotify-launcher"
    "sshfs"
    "starship"
    "tlp"
    "tlpui"
    "tty-clock"
    "ttf-fira-code"
    "ttf-font-awesome"
    "ttf-jetbrains-mono"
    "ttf-nerd-fonts-symbols"
    "vlc"
    "vdhcoapp"
    "vim"
    "visual-studio-code-bin"
    "wget"
    "wl-clipboard"
    "xclip"
    "yazi"
    "zen-browser-avx2-bin"
    "zoxide"
    "zsh"
)

# Stop the script on error
set -e
trap 'echo_error "An unexpected error occurred. Execution stopped." && exit 1' ERR

# --- PREREQUISITE VALIDATION ---

function check_prerequisite() {
    if ! command -v yay &>/dev/null; then
        echo_error "yay is not installed. Install yay before continuing."
        exit 1
    fi
}

# --- CONFIRMATION BEFORE EACH FUNCTION ---

confirm() {
    local message="$1"
    read -p "$(echo -e ${YELLOW}"$message (y/n) "${NC})" response
    if [[ "$response" != "y" ]]; then
        echo_warning "Operation skipped by the user."
        return 1
    fi
    return 0
}

# --- TASK FUNCTIONS ---

# Update package database
function update_package_database() {
    print_separator "Updating package database"
    if confirm "Do you want to update the package database?"; then
        sudo pacman -Sy --quiet || {
            echo_error "Failed to update package database"
            exit 1
        }
    fi
}

# Configure clock for dual boot with Windows
function config_clock() {
    print_separator "Configuring internal clock for dual boot with Windows"
    if confirm "Do you want to configure the internal clock for dual boot with Windows?"; then
        timedatectl set-local-rtc 1 --adjust-system-clock
    fi
}

# Uninstall packages with cleaner output
function uninstall_packages() {
    print_separator "Uninstalling packages"
    if confirm "Do you want to uninstall the listed packages?"; then
        for pkg in "${uninstall[@]}"; do
            echo_arrow "Checking $pkg..."

            if ! pacman -Q "$pkg" &>/dev/null; then
                echo_success "$pkg is not installed"
            else
                echo_arrow "Uninstalling $pkg..."

                # Uninstall the package and redirect output to /dev/null
                if yay -Rns --noconfirm "$pkg" >/dev/null 2>&1; then
                    echo_success "$pkg uninstalled"
                else
                    echo_error "$pkg not uninstalled"
                fi
            fi
        done
    fi
}

# Install packages with cleaner output
function install_packages() {
    print_separator "Installing packages"
    if confirm "Do you want to install the listed packages?"; then
        for pkg in "${packages[@]}"; do
            echo_arrow "Checking $pkg..."

            if pacman -Q "$pkg" &>/dev/null; then
                echo_success "$pkg is already installed"
            else
                echo_arrow "Installing $pkg..."

                # Install the package and redirect output to /dev/null
                if yay -S --noconfirm --quiet "$pkg" >/dev/null 2>&1; then
                    echo_success "$pkg installed"
                else
                    echo_error "$pkg not installed"
                fi
            fi
        done
    fi
}

# Install Megasync
function install_megasync() {
    print_separator "Installing Megasync"
    if confirm "Do you want to install Megasync?"; then
        local megasync_pkg="megasync-x86_64.pkg.tar.zst"
        local megasync_url="https://mega.nz/linux/repo/Arch_Extra/x86_64/$megasync_pkg"
        cd ~/Downloads

        if [ ! -f "$megasync_pkg" ]; then
            echo_arrow "Downloading Megasync..."
            wget "$megasync_url" || {
                echo_error "Failed to download Megasync"
                exit 1
            }
        fi

        echo_arrow "Installing Megasync..."
        sudo pacman -U "$megasync_pkg" --noconfirm || echo_error "Failed to install Megasync"
        rm -f "$megasync_pkg"
    fi
}

# Replace config folders and files
function replace_config() {
    local src="$1"
    local dest="$2"
    echo_arrow "Copying $src to $dest..."
    if confirm "Do you want to replace the content of $src with the content of $dest?"; then
        cp -r "$src"/* "$dest/"
        echo_success "Replacement of $src completed"
    fi
}

# Backup archive restoration
function restore_backup() {
    local ARCHIVE_BACKUP="../backup_latest/"

    if [ -d "$ARCHIVE_BACKUP" ]; then
        print_separator "Restoring backup"
        if confirm "Do you want to restore the backup?"; then
            echo_arrow "Replacing files and folders..."
            for file in "$ARCHIVE_BACKUP/home/bnsplit/."*; do
                file_name=$(basename "$file")
                dest_file="$HOME/$file_name"

                # Check if the file is a broken symbolic link
                if [ -L "$dest_file" ] && [ ! -e "$dest_file" ]; then
                    echo_warning "$dest_file is a broken symlink, deleting..."
                    rm "$dest_file"
                fi

                if [ -f "$file" ] || [ -d "$file" ]; then
                    echo_arrow "Copying $file_name to ~/"
                    cp -r "$file" "$HOME/"
                    echo_success "$file_name copied to ~/"
                fi
            done

            local makepkgconf_source="$ARCHIVE_BACKUP/etc/makepkg.conf"
            local makepkgconf_dest="/etc/makepkg.conf"
            sudo cp "$makepkgconf_source" "$makepkgconf_dest" && echo_success "makepkg.conf replaced in /etc/"

            copy_desktop_file() {
                local source="$1"
                local dest="$2"
                sudo cp "$source" "$dest" && echo_success "$(basename "$dest") replaced in /usr/share/applications/"
            }
            local desktop_files=(
                "google-chrome.desktop"
                "obsidian.desktop"
                "zen-alpha.desktop"
            )

for file in "${desktop_files[@]}"; do
    copy_desktop_file "$ARCHIVE_BACKUP/usr/share/applications/$file" "/usr/share/applications/$file"
done

            echo_success "Restoration complete"
        fi
    else
        echo_warning "No backup archive folder found. Proceeding to the next step."
    fi
}

# Printer setup prompt
function configure_printer() {
    print_separator "Printer setup"
    if confirm "Do you want to configure a printer with hp-setup -i?"; then
        sudo systemctl enable --now cups && sudo systemctl start cups && sudo hp-setup -i || echo_error "Printer setup failed"
    fi
}

# Git setup
source ./git_config.sh

# Bluetooth setup
function configure_bluetooth() {
    print_separator "Bluetooth setup"
    if confirm "Do you want to configure Bluetooth?"; then
        sudo systemctl enable --now bluetooth.service
        sudo systemctl start bluetooth.service
        sudo systemctl enable --now bluetooth-autoconnect.service
    fi
}

# TLP Configuration
function configure_tlp() {
    print_separator "Configuring TLP"
    if confirm "Do you want to configure TLP?"; then
        sudo systemctl enable --now tlp
    fi
}

# Docker Configuration
function configure_docker() {
    print_separator "Configuring Docker"
    if confirm "Do you want to configure Docker?"; then
        echo_arrow "Enabling Docker service..."
        sudo systemctl enable --now docker &&
            echo_success "Docker service enabled and started" &&
            echo_arrow "Adding user to Docker group" &&
            sudo usermod -aG docker $USER &&
            echo_success "User added"
    fi
}

# Savedesktop
function savedesktop_config() {
    print_separator "Restoring with Savedesktop"
    if confirm "Do you want to restore GNOME with Savedesktop?"; then
        wget -qO /tmp/savedesktop-native-installer.py https://raw.githubusercontent.com/vikdevelop/SaveDesktop/main/native/native_installer.py && python3 /tmp/savedesktop-native-installer.py --install &&
            ~/.local/bin/savedesktop --import-config ~/dev/dotfiles/Gnome_Conf.sd.tar.gz
    fi
}

# Hyprland Configuration
function hypr_config() {
    print_separator "Configuring Hyprland"
    if confirm "Do you want to configure Hyprland?"; then
        hypr_packages=(
            "blueman"
            "breeze"
            "breeze5"
            "brightnessctl"
            "clipse"
            "grim"
            "hypridle"
            "hyprland"
            "hyprlock"
            "hyprpaper"
            "hyprpicker"
            "imagemagick"
            "network-manager-applet"
            "networkmanager"
            "python-pywal16"
            "qt6-wayland"
            "qt6ct-kde"
            "rofi-wayland"
            "slurp"
            "swaync"
            "swww"
            "waybar"
            "waypaper"
            "wlogout"
            "xdg-desktop-portal-gtk"
            "xdg-desktop-portal-hyprland"
        )

        for pkg in "${hypr_packages[@]}"; do
            echo_arrow "Checking $pkg..."

            if pacman -Q "$pkg" &>/dev/null; then
                echo_success "$pkg is already installed"
            else
                echo_arrow "Installing $pkg..."

                if yay -S --noconfirm --quiet "$pkg" >/dev/null 2>&1; then
                    echo_success "$pkg installed"
                else
                    echo_error "$pkg not installed"
                fi
            fi
        done

        # Enable and start NetworkManager
        sudo systemctl enable NetworkManager
        sudo systemctl start NetworkManager
    fi
}

# Prompt to restart the system
function restart() {
    print_separator "It is recommended to restart the system"
    if confirm "Do you want to restart?"; then
        sudo systemctl reboot
    fi
}

# --- MAIN EXECUTION ---

function main() {
    check_prerequisite
    config_clock
    update_package_database
    uninstall_packages
    install_packages
    configure_tlp
    savedesktop_config
    install_megasync
    restore_backup
    configure_printer
    configure_git
    configure_bluetooth
    configure_docker
    hypr_config
    restart
}

main
