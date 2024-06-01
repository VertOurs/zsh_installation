#!/bin/bash

source ./utils.sh

# Vérifier la présence des outils de construction nécessaires
check_build_tools() {
    local missing_tools=()
    for tool in gcc make wget tar libncursesw5-dev; do
        if ! command_exists "$tool"; then
            missing_tools+=("$tool")
        fi
    done

    if [ ${#missing_tools[@]} -ne 0 ]; then
        if [ "$LANGUAGE" = "fr" ]; then
            echo "Les outils suivants sont nécessaires mais ne sont pas installés : ${missing_tools[*]}"
            echo "Veuillez les installer manuellement avant de continuer."
        else
            echo "The following tools are required but not installed: ${missing_tools[*]}"
            echo "Please install them manually before proceeding."
        fi
        exit 1
    fi
}

check_build_tools
