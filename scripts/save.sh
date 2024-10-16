#!/bin/bash
clear

# Définir les couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Fonction pour afficher des messages avec des flèches
function echo_arrow() { echo -e "${BLUE}=> $1${NC}"; }
function echo_success() { echo -e "${GREEN}✓ $1${NC}"; }
function echo_warning() { echo -e "${YELLOW}⚠ $1${NC}"; }
function echo_error() { echo -e "${RED}✗ $1${NC}\n"; }
function print_separator() {
    echo -e "\n${CYAN}##############################${NC}"
    echo -e "${CYAN}# $1${NC}"
    echo -e "${CYAN}##############################${NC}\n"
}

# Répertoire où les fichiers sauvegardés seront stockés
BACKUP_DIR="$HOME/dev/dotfiles/backup_latest"
mkdir -p "$BACKUP_DIR/home" "$BACKUP_DIR/etc" || { echo_error "Impossible de créer les répertoires de sauvegarde"; exit 1; }

# Dossiers et fichiers à sauvegarder
items_to_backup=(
    # Dossiers dans $HOME/.config
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

    # Fichiers dans $HOME/.config
    "$HOME/.config/starship.toml"

    # Dossiers dans $HOME/.cache et autres dossiers
    "$HOME/.cache/wal/"
    "$HOME/.cache/wallpaper"
    "$HOME/.cache/wallpaper-blur"
    "$HOME/.fonts"
    # "$HOME/.zen"

    # Fichiers dans $HOME
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.Xresources"

    # Fichiers dans /etc
    "/etc/makepkg.conf"
)

print_separator "Sauvegarde des fichiers et dossiers dans $BACKUP_DIR"

# Copie des fichiers et dossiers dans le répertoire de sauvegarde
for item in "${items_to_backup[@]}"; do
    if [ -e "$item" ]; then
        dest="$BACKUP_DIR/${item}"
        dest_dir=$(dirname "$dest")
        mkdir -p "$dest_dir" || { echo_error "Impossible de créer le répertoire $dest_dir"; exit 1; }

        if [ -d "$item" ]; then
            echo_arrow "Copie du répertoire $item..."
            cp -rT "$item" "$dest" || { echo_error "Erreur lors de la copie de $item"; exit 1; }
        else
            echo_arrow "Copie du fichier $item..."
            cp "$item" "$dest" || { echo_error "Erreur lors de la copie de $item"; exit 1; }
        fi
    else
        echo_warning "$item n'existe pas, saut de la sauvegarde"
    fi
done
echo_success "Sauvegarde terminée."
