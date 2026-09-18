# Installation de zsh + Oh My Zsh

![ShellCheck](https://github.com/VertOurs/zsh_installation/actions/workflows/shellcheck.yml/badge.svg)

Installe et configure zsh avec Oh My Zsh en une commande, sur les principales distributions Linux.

## Fonctionnalités

- Installation de zsh via le gestionnaire de paquets natif de la distribution
- Installation de Oh My Zsh (mode non interactif)
- Choix du thème Oh My Zsh au lancement
- Idempotent : ne réinstalle rien si zsh ou Oh My Zsh sont déjà présents
- Fonctionne depuis n'importe quel dossier

## Prérequis

- `sudo` (pour l'installation des paquets et le changement de shell)
- `curl` (pour télécharger l'installateur de Oh My Zsh)

## Distributions supportées

- Fedora (dnf)
- Debian / Ubuntu / Mint (apt)
- Arch (pacman)
- openSUSE (zypper)

## Utilisation

```
./setup_zsh.sh
```

## Ce que ça modifie

- Le shell par défaut de l'utilisateur (via `chsh`)
- `~/.zshrc` (le thème Oh My Zsh est configuré dedans ; une sauvegarde `~/.zshrc.bak` est créée avant modification)

## Structure

| Fichier | Rôle |
|---|---|
| `setup_zsh.sh` | Point d'entrée : orchestre les autres scripts |
| `install_zsh.sh` | Installe zsh et définit le shell par défaut |
| `install_oh_my_zsh.sh` | Installe Oh My Zsh |
| `utils.sh` | Fonctions partagées (détection de commande, animation) |
