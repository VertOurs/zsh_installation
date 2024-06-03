#!/bin/bash

# Fonction pour vérifier la disponibilité d'une commande
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

animation() {
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
}
