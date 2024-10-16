#!/bin/bash
clear

# --- VARIABLES ---

# Définir les couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# --- FONCTIONS DE MESSAGE ---

function echo_arrow() { echo -e "${BLUE}=> $1${NC}"; }
function echo_success() { echo -e "${GREEN}✓ $1${NC}"; }
function echo_warning() { echo -e "${YELLOW}⚠ $1${NC}"; }
function echo_error() { echo -e "${RED}✗ $1${NC}\n"; }
function print_separator() {
    echo -e "\n${CYAN}##############################${NC}"
    echo -e "${CYAN}# $1${NC}"
    echo -e "${CYAN}##############################${NC}\n"
}

# Liste des paquets à désinstaller
uninstall=(
    "power-profiles-daemon"
    "emacs"
    "gnome-console"
)

# Liste des paquets à installer
packages=(
    "amd-ucode"
    "wl-clipboard"
    "xclip"
    "git"
    "wget"
    "curl"
    "sshfs"
    "cups"
    "hplip"
    "fzf"
    "fastfetch"
    "btop"
    "vlc"
    "spotify-launcher"
    "flatpak"
    "nodejs-lts-iron"
    "npm"
    "cava"
    "tty-clock"
    "ttf-fira-code"
    "ttf-font-awesome"
    "ttf-nerd-fonts-symbols"
    "ttf-jetbrains-mono"
    "fish"
    "zsh"
    "zoxide"
    "starship"
    "kitty"
    "touchegg"
    "tlp"
    "tlpui"
    "yazi"
    "vim"
    "neovim"
    "zen-browser-bin"
    "gnome-weather"
    "extension-manager"
    "gnome-text-editor"
    "gnome-calendar"
    "evince"
    "loupe"
    "simple-scan"
    "gnome-terminal"
    "evolution"
    "gapless"
    "resources"
    "cheese"
    "appimagelauncher"
    "docker"
    "docker-buildx"
    "libreoffice-still-fr"
    "google-chrome"
    "visual-studio-code-bin"
    "pamac-all"
    "onlyoffice-bin"
)

# Arrête le script en cas d'erreur
set -e
trap 'echo_error "Une erreur inattendue est survenue. Exécution stoppée." && exit 1' ERR

# --- VALIDATION DES OUTILS PRÉREQUIS ---

function check_prerequisite() {
    if ! command -v yay &>/dev/null; then
        echo_error "yay n'est pas installé. Installez yay avant de continuer."
        exit 1
    fi
}

# --- CONFIRMATION AVANT CHAQUE FONCTION ---

confirm() {
    local message="$1"
    read -p "$(echo -e ${YELLOW}"$message (y/n) "${NC})" response
    if [[ "$response" != "y" ]]; then
        echo_warning "Opération sautée par l'utilisateur."
        return 1
    fi
    return 0
}

# --- FONCTIONS DE TÂCHES ---

# Mise à jour des bases de données des paquets
function update_package_database() {
    print_separator "Mise à jour de la base de données des paquets"
    if confirm "Voulez-vous mettre à jour la base de données des paquets ?"; then
        sudo pacman -Sy --quiet || {
            echo_error "Échec de la mise à jour des bases de données"
            exit 1
        }
    fi
}

# Configuration de l'heure pour le dualboot avec windows
function config_clock() {
    print_separator "Configuration de l'horloge interne pour un dual boot avec Windows"
    if confirm "Voulez-vous configurer l'horloge interne pour un dual boot avec Windows"; then
        timedatectl set-local-rtc 1 --adjust-system-clock
    fi
}

# Désnstallation des paquets avec une sortie plus propre
function uninstall_packages() {
    print_separator "Déinstallation des paquets"
    if confirm "Voulez-vous désinstaller les paquets listés ?"; then
        for pkg in "${uninstall[@]}"; do
            echo_arrow "Vérification de $pkg..."

            if ! pacman -Q "$pkg" &>/dev/null; then
                echo_success "$pkg n'est pas installé"
            else
                echo_arrow "Désinstallation de $pkg..."

                # Installer le paquet et rediriger la sortie vers /dev/null
                if yay -Rns --noconfirm "$pkg" >/dev/null 2>&1; then
                    echo_success "$pkg désinstallé"
                else
                    echo_error "$pkg non désinstallé"
                fi
            fi
        done
    fi
}

# Installation des paquets avec une sortie plus propre
function install_packages() {
    print_separator "Installation des paquets"
    if confirm "Voulez-vous installer les paquets listés ?"; then
        for pkg in "${packages[@]}"; do
            echo_arrow "Vérification de $pkg..."

            if pacman -Q "$pkg" &>/dev/null; then
                echo_success "$pkg est déjà installé"
            else
                echo_arrow "Installation de $pkg..."

                # Installer le paquet et rediriger la sortie vers /dev/null
                if yay -S --noconfirm --quiet "$pkg" >/dev/null 2>&1; then
                    echo_success "$pkg installé"
                else
                    echo_error "$pkg non installé"
                fi
            fi
        done
    fi
}

# Installation de Megasync
function install_megasync() {
    print_separator "Installation de Megasync"
    if confirm "Voulez-vous installer Megasync ?"; then
        local megasync_pkg="megasync-x86_64.pkg.tar.zst"
        local megasync_url="https://mega.nz/linux/repo/Arch_Extra/x86_64/$megasync_pkg"
        cd ~/Téléchargements

        if [ ! -f "$megasync_pkg" ]; then
            echo_arrow "Téléchargement de Megasync..."
            wget "$megasync_url" || {
                echo_error "Échec du téléchargement de Megasync"
                exit 1
            }
        fi

        echo_arrow "Installation de Megasync..."
        sudo pacman -U "$megasync_pkg" --noconfirm || echo_error "Échec de l'installation de Megasync"
        rm -f "$megasync_pkg"
    fi
}

# Installation de Video Download Helper
function install_vdh() {
    print_separator "Installation de Video Download Helper"
    if confirm "Voulez-vous installer Video Download Helper ?"; then
        cd "$HOME/dev/dotfiles/scripts/vdhcoapp-2.0.19/"
        ./vdhcoapp install
        cd
    fi
}

# Remplacement des dossiers et fichiers de configuration
function replace_config() {
    local src="$1"
    local dest="$2"
    echo_arrow "Copie de $src dans $dest..."
    if confirm "Voulez-vous remplacer le contenu de $src par le contenu de $dest ?"; then
        cp -r "$src"/* "$dest/"
        echo_success "Remplacement de $src terminé"
    fi
}

# Archive de sauvegarde
function restore_backup() {
    local ARCHIVE_BACKUP="$HOME/dev/dotfiles/backup_latest"

    if [ -d "$ARCHIVE_BACKUP" ]; then
        print_separator "Restauration de la sauvegarde"
        if confirm "Voulez-vous restaurer la sauvegarde ?"; then
            echo_arrow "Remplacement des fichiers et dossiers..."
            for file in "$ARCHIVE_BACKUP/home/bnsplit/."*; do
                file_name=$(basename "$file")
                dest_file="$HOME/$file_name"

                # Vérifier si le fichier est un lien symbolique brisé
                if [ -L "$dest_file" ] && [ ! -e "$dest_file" ]; then
                    echo_warning "$dest_file est un lien symbolique brisé, suppression..."
                    rm "$dest_file"
                fi

                if [ -f "$file" ] || [ -d "$file" ]; then
                    echo_arrow "Copie de $file_name dans ~/"
                    cp -r "$file" "$HOME/"
                    echo_success "$file_name copié dans ~/"
                fi
            done

            local touchpad_conf_source="$ARCHIVE_BACKUP/etc/X11/xorg.conf.d/30-touchpad.conf"
            local touchpad_conf_dest="/etc/X11/xorg.conf.d/30-touchpad.conf"
            sudo cp "$touchpad_conf_source" "$touchpad_conf_dest" && echo_success "30-touchpad.conf remplacé dans /etc/X11/xorg.conf.d/"

            local makepkgconf_source="$ARCHIVE_BACKUP/etc/makepkg.conf"
            local makepkgconf_dest="/etc/makepkg.conf"
            sudo cp "$makepkgconf_source" "$makepkgconf_dest" && echo_success "makepkg.conf remplacé dans /etc/"

            echo_success "Restauration terminée"
        fi
    else
        echo_warning "Aucun dossier archive de sauvegarde trouvée. Passer à l'étape suivante."
    fi
}

# Demande de configuration d'une imprimante
function configure_printer() {
    print_separator "Configuration d'une imprimante"
    if confirm "Voulez-vous configurer une imprimante avec hp-setup -i ?"; then
        sudo systemctl enable --now cups && sudo systemctl start cups && sudo hp-setup -i || echo_error "Échec de la configuration de l'imprimante"
    fi
}

# Configuration de Git
source ./git_config.sh

# Configuration du Bluetooth
function configure_bluetooth() {
    print_separator "Configuration du Bluetooth"
    if confirm "Voulez-vous configurer le Bluetooth ?"; then
        sudo systemctl enable --now bluetooth
    fi
}

# Configuration de tlp
function configure_tlp() {
    print_separator "Configuration de tlp"
    if confirm "Voulez-vous configurer tlp ?"; then
        sudo systemctl enable --now tlp
    fi
}

# Configuration de Docker
function configure_docker() {
    print_separator "Configuration de Docker"
    if confirm "Voulez-vous configurer Docker ?"; then
        echo_arrow "Activation du service docker..."
        sudo systemctl enable --now docker &&
            echo_success "Service Docker activé et démarré" &&
            echo_arrow "Rajout de l'utilisateur au groupe Docker" &&
            sudo usermod -aG docker $USER &&
            echo_success "Utilisateur ajouté"
    fi
}

# Savedesktop
function savedesktop_config() {
    print_separator "Restoration avec savedesktop"
    if confirm "Voulez-vous restorer GNOME avec savedesktop ?"; then
        wget -qO /tmp/savedesktop-native-installer.py https://raw.githubusercontent.com/vikdevelop/SaveDesktop/main/native/native_installer.py && python3 /tmp/savedesktop-native-installer.py --install &&
            ~/.local/bin/savedesktop --import-config ~/dev/dotfiles/Gnome_Conf.sd.tar.gz
    fi
}

# Hyprland config
function hypr_config() {
    print_separator "Configuration de Hyprland"
    if confirm "Voulez-vous configurer Hyprland ?"; then
        hypr_packages=(
            "hyprland"
            "hyprlock"
            "hypridle"
            "hyprpicker"
            "hyprpaper" 
            "wlogout"
            "waybar"
            "rofi-wayland"
            "waypaper"
            "swww"
            "blueman"
            "imagemagick"
            # "aylurs-gtk-shell"
            "swaync"
            "python-pywal16"
            "brightnessctl"
            "networkmanager"
            "network-manager-applet"
            "clipse"
            "grim"
            "slurp"
            "xdg-desktop-portal-hyprland"
            "xdg-desktop-portal-gtk"

        )

        for pkg in "${hypr_packages[@]}"; do
            echo_arrow "Vérification de $pkg..."

            if pacman -Q "$pkg" &>/dev/null; then
                echo_success "$pkg est déjà installé"
            else
                echo_arrow "Installation de $pkg..."

                if yay -S --noconfirm --quiet "$pkg" >/dev/null 2>&1; then
                    echo_success "$pkg installé"
                else
                    echo_error "$pkg non installé"
                fi
            fi
        done

        # Active et démarre networkmanager
        sudo systemctl enable NetworkManager
        sudo systemctl start NetworkManager


    fi
}

# Demande à redémarrer le systeme
function restart() {
    print_separator "Il est recommandé de redémarrer le systeme"
    if confirm "Voulez-vous redémarrer ?"; then
        sudo systemctl reboot
    fi
}

# Fonction principale
function main() {
    check_prerequisite
    config_clock
    update_package_database
    uninstall_packages
    install_packages
    configure_tlp
    savedesktop_config
    install_megasync
    install_vdh
    restore_backup
    configure_printer
    configure_git
    configure_bluetooth
    configure_docker
    hypr_config
    restart
}

main
