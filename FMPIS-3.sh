#!/bin/bash

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

# Comienza el script
printf "¿Quiere iniciar la tercera parte del script? [y/n]\n"
read ANSWER
case "$ANSWER" in
  y)
    echo
    printf "Iniciando personalización del sistema operativo\n"
    sleep 1
    echo

    # Cambia el symlink de sh por dash
    printf "${BOLD}${GREEN}Creando symlink de dash para sh${NC}\n"
    sleep 1
    sudo ln -sfT dash /usr/bin/sh
    readlink /usr/bin/sh
    echo

    # Configura ZSH como el shell por defecto
    printf "${BOLD}${GREEN}Cambiando bash por zsh${NC}\n"
    sleep 1
    chsh -s /bin/zsh
    echo

    # Inicia el servicio de Auto CPU-Freq
    printf "${BOLD}${GREEN}Iniciando Auto CPU-Freq${NC}\n"
    sleep 1
    sudo systemctl enable --now auto-cpufreq
    sudo auto-cpufreq --live
    echo

    # Mueve archivos de configuración a sus ubicaciones correspondientes
    printf "${BOLD}${GREEN}Instalando mis configuraciones${NC}\n"
    sleep 1
    mv configs/alacritty ~/.config
    mv configs/bin ~/.local
    mv configs/zathura ~/.config
    mv configs/.vim ~/
    mv configs/.vimrc ~/
    mv configs/mpv ~/.config
    mv configs/.zshrc ~/
    mv configs/zsh ~/.cache
    echo

    # Instala mi tema personal de Gnome 40
    printf "${BOLD}${GREEN}Instalando mi tema de gnome-shell${NC}\n"
    sleep 1
    if [ -e ~/.themes ]; then
      git clone https://github.com/fMorales-97/Fradwaita.git
      mv Fradwaita ~/.themes
    else
      mkdir ~/.themes
      git clone https://github.com/fMorales-97/Fradwaita.git
      mv Fradwaita ~/.themes
    fi
    echo

    # Mueve mis wallpapers a la carpeta de imágenes
    printf "${BOLD}${GREEN}Moviendo wallpapers${NC}\n"
    sleep 1
    mv configs/wallpapers/*.* ~/Imágenes
    echo
    printf "${BOLD}${GREEN}La tercera parte del script ha finalizado${NC}\n"
    sleep 1
    printf "${BOLD}${GREEN}Reinicie la computadora para ver todos los cambios${NC}\n"
    ;;
  n)
    printf "Ha cancelado la operación\n"
    ;;
  *)
    printf "${BOLD}${RED}Esa opción no es válida${NC}\n"
    sleep 1
    ;;
esac
