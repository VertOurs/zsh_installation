#!/bin/bash

# Se placer dans le dossier du script pour que les chemins relatifs fonctionnent
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

source ./utils.sh

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh est déjà installé."
else
    if ! command_exists curl; then
        echo "curl est requis pour installer Oh My Zsh. Veuillez l'installer et relancer le script."
        exit 1
    fi

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Échec de l'installation de Oh My Zsh."
        exit 1
    fi
fi
