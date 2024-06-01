#!/bin/bash

# Détection de la langue du système
LANGUAGE=$(echo $LANG | cut -d_ -f1)

# Fonction pour vérifier la disponibilité d'une commande
command_exists() {
    command -v "$1" >/dev/null 2>&1
}
