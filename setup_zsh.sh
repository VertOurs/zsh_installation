#!/bin/bash

# Se placer dans le dossier du script pour que les chemins relatifs fonctionnent
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# Installation de zsh
./install_zsh.sh || { echo "Échec de l'installation de zsh, arrêt du script."; exit 1; }

# Installation de Oh My Zsh
./install_oh_my_zsh.sh || { echo "Échec de l'installation de Oh My Zsh, arrêt du script."; exit 1; }

# Proposer les thèmes et demander à l'utilisateur de choisir
echo "Choisissez un thème pour Oh My Zsh :"
echo "1) edvardm"
echo "2) agnoster"
echo "3) fwalch"
echo "4) jispwoso"
echo "5) jonathan"

read -r -p "Entrez le numéro du thème (1-5) : " theme_choice

case $theme_choice in
    1) theme="edvardm" ;;
    2) theme="agnoster" ;;
    3) theme="fwalch" ;;
    4) theme="jispwoso" ;;
    5) theme="jonathan" ;;
    *)
        echo "Choix invalide. Utilisation du thème par défaut."
        theme="robbyrussell"
        ;;
esac

# Configurer le thème choisi dans .zshrc
sed -i.bak "s/^ZSH_THEME=.*/ZSH_THEME=\"$theme\"/" ~/.zshrc

# Message de confirmation
echo "Installation de zsh et Oh My Zsh terminée, zsh est maintenant votre shell par défaut."
echo "Veuillez redémarrer votre terminal pour appliquer les changements."
