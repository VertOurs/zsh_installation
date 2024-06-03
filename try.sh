#!/bin/bash


sudo -v
echo -n "Installation de neofetch : "

# Démarrage de l'animation en arrière-plan
while true; do
    echo -n "."
    sleep 1
    echo -n "."
    sleep 1
    echo -n "."
    sleep 1
    echo -ne "\b\b\b   \b\b\b"
done &

# Capturer le PID de l'animation
ANIMATION_PID=$!

# Exécution de la commande d'installation avec la sortie redirigée vers /dev/null
sudo apt-get install -y neofetch > /dev/null 2>&1

# Arrêter l'animation
kill $ANIMATION_PID
echo ""
echo "Installation terminée."