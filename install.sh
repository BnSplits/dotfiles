#!/usr/bin/bash

# Mettre à jour le système
sudo pacman -Syu

# Installer les paquets depuis les dépôts officiels de Arch Linux
sudo pacman -S --needed cups hplip system-config-printer picom arc-dark-theme kvantum lxappearance ttf-fira-code ttf-font-awesome ttf-nerd-fonts-symbols zsh broadcom-wl neofetch btop thunar kitty feh polybar rofi evince vim neovim spotify-launcher qt5ct gnome-screenshot fzf ark appimagelauncher flatpak

# Installer les paquets AUR via yay
yay -S --needed thorium-browser-bin cava eog clifm visual-studio-code-bin onlyoffice pywal-16-colors diodon arandr yazi

# Installer les paquets Flatpak
flatpak install -y flathub com.notesnook.Notesnook
flatpak install -y flathub org.onlyoffice.desktopeditors

# Télécharger et installer Megasync
wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst
sudo pacman -U "$PWD/megasync-x86_64.pkg.tar.zst"

# Installer les plugins d'imprimante HP
# Cette vidéo explique des trucs : https://www.youtube.com/watch?v=jnmCbEWNV1w
# Cette commande permet de faire la config facilement
# hp-setup -i
