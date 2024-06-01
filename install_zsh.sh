#!/bin/bash

source ./utils.sh

# Téléchargement et installation de zsh à partir des sources
install_zsh_from_source() {
    if [ "$LANGUAGE" = "fr" ]; then
        echo "zsh n'est pas disponible dans les dépôts. Installation à partir des sources."
    else
        echo "zsh is not available in the repositories. Installing from source."
    fi

    ./check_build_tools.sh

    wget https://sourceforge.net/projects/zsh/files/latest/download -O zsh.tar.xz
    tar -xf zsh.tar.xz
    cd zsh-* || exit
    ./configure
    make
    sudo make install
    cd ..
    rm -rf zsh-* zsh.tar.xz
}

# Installation de zsh en fonction du gestionnaire de paquets
install_zsh() {
    if command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y zsh || install_zsh_from_source
    elif command_exists yum; then
        sudo yum install -y zsh || install_zsh_from_source
    elif command_exists dnf; then
        sudo dnf install -y zsh || install_zsh_from_source
    elif command_exists zypper; then
        sudo zypper install -y zsh || install_zsh_from_source
    elif command_exists pacman; then
        sudo pacman -Syu --noconfirm zsh || install_zsh_from_source
    else
        if [ "$LANGUAGE" = "fr" ]; then
            echo "Gestionnaire de paquets non supporté. Veuillez installer zsh manuellement."
        else
            echo "Package manager not supported. Please install zsh manually."
        fi
        exit 1
    fi
}

install_zsh
