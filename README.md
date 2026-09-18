# Installation de zsh + Oh My Zsh

![ShellCheck](https://github.com/VertOurs/zsh_installation/actions/workflows/shellcheck.yml/badge.svg)

Scripts d'installation et de configuration de zsh et Oh My Zsh.

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
