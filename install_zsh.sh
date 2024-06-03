#!/bin/bash

source ./utils.sh

sudo -v
echo -n "Installation de zsh : "
animation
install_zsh() {
    if command_exists apt; then
        sudo apt-get update && sudo apt-get install -y zsh > /dev/null 2>&1
    elif command_exists dnf; then
        sudo dnf install -y zsh > /dev/null 2>&1
    elif command_exists pacman; then
        sudo pacman -Syu --noconfirm zsh > /dev/null 2>&1
    else
        echo "Gestionnaire de paquets non supporté. Veuillez installer zsh manuellement."
        exit 1
    fi
}

install_zsh
# definir le shell par défaut
chsh -s /bin/zsh
