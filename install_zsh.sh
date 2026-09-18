#!/bin/bash

# Se placer dans le dossier du script pour que les chemins relatifs fonctionnent
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

source ./utils.sh

install_zsh() {
    if command_exists apt; then
        { sudo apt-get update && sudo apt-get install -y zsh; } > /dev/null 2>&1
    elif command_exists dnf; then
        sudo dnf install -y zsh > /dev/null 2>&1
    elif command_exists pacman; then
        sudo pacman -Syu --noconfirm zsh > /dev/null 2>&1
    elif command_exists zypper; then
        sudo zypper install -y zsh > /dev/null 2>&1
    else
        echo "Gestionnaire de paquets non supporté. Veuillez installer zsh manuellement."
        return 1
    fi
}

if command_exists zsh; then
    echo "zsh est déjà installé."
else
    sudo -v
    echo -n "Installation de zsh : "
    animation
    install_zsh
    install_status=$?
    stop_animation

    if [ $install_status -ne 0 ]; then
        echo "Échec de l'installation de zsh."
        exit 1
    fi
    echo "Installation de zsh terminée."
fi

# definir le shell par défaut
if [ "$(basename "$SHELL")" != "zsh" ]; then
    chsh -s "$(command -v zsh)"
fi
