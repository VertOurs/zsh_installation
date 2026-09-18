#!/bin/bash

# Se placer dans le dossier du script pour que les chemins relatifs fonctionnent
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh est déjà installé."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
