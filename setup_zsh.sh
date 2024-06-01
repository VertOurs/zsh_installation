#!/bin/bash

source ./utils.sh

# Installation de zsh
./install_zsh.sh

# Installation de Oh My Zsh
./install_oh_my_zsh.sh

# Proposer les thèmes et demander à l'utilisateur de choisir
if [ "$LANGUAGE" = "fr" ]; then
    echo "Choisissez un thème pour Oh My Zsh :"
    echo "1) edvardm"
    echo "2) agnoster"
    echo "3) fwalch"
    echo "4) jispwoso"
    echo "5) jonathan"
else
    echo "Choose a theme for Oh My Zsh:"
    echo "1) edvardm"
    echo "2) agnoster"
    echo "3) fwalch"
    echo "4) jispwoso"
    echo "5) jonathan"
fi

read -p "Entrez le numéro du thème (1-5) : " theme_choice

case $theme_choice in
    1) theme="edvardm" ;;
    2) theme="agnoster" ;;
    3) theme="fwalch" ;;
    4) theme="jispwoso" ;;
    5) theme="jonathan" ;;
    *)
        if [ "$LANGUAGE" = "fr" ]; then
            echo "Choix invalide. Utilisation du thème par défaut."
        else
            echo "Invalid choice. Using default theme."
        fi
        theme="robbyrussell"
        ;;
esac

# Configurer le thème choisi dans .zshrc
sed -i.bak "s/^ZSH_THEME=.*/ZSH_THEME=\"$theme\"/" ~/.zshrc

# Changer le shell par défaut en zsh
chsh -s $(which zsh)

# Message de confirmation
if [ "$LANGUAGE" = "fr" ]; then
    echo "Installation de zsh et Oh My Zsh terminée, zsh est maintenant votre shell par défaut."
else
    echo "Installation of zsh and Oh My Zsh completed, zsh is now your default shell."
fi

echo "Veuillez redémarrer votre terminal pour appliquer les changements."
