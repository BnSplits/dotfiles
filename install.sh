#!/usr/bin/bash

sudo pacman -S hplip picom lxappearance ttf-fira-code ttf-font-awesome ttf-nerd-fonts-symbols  zsh broadcom-wl neofetch btop thunar kitty feh polybar rofi evince vim neovim spotify-launcher qt5ct gnome-screenshot fzf ark appimagelauncher flatpak

yay -S thorium-browser-bin cava eog clifm visual-studio-code-bin onlyoffice pywal-16-colors diodon arandr

flatpak install flathub com.notesnook.Notesnook
flatpak install flathub org.onlyoffice.desktopeditors

wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst && sudo pacman -U "$PWD/megasync-x86_64.pkg.tar.zst"
