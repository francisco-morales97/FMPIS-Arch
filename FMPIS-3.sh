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
    printf "${GREEN}${BOLD}Creando symlink de dash para sh${NC}\n"
    sleep 1
    sudo ln -sfT dash /usr/bin/sh
    readlink /usr/bin/sh
    echo

    # Configura ZSH como el shell por defecto
    printf "${GREEN}${BOLD}Cambiando bash por zsh${NC}\n"
    sleep 1
    chsh -s /bin/zsh
    echo

    # Mueve archivos de configuración a sus ubicaciones correspondientes
    printf "${GREEN}${BOLD}Instalando mis configuraciones${NC}\n"
    sleep 1
    mv configs/xdg_config_home/alacritty ~/.config/
    mv configs/bin ~/.local/
    mv configs/xdg_config_home/mpv ~/.config/
    mv configs/xdg_config_home/nvim ~/.config/
    mv configs/xdg_data_home/nvim ~/.local/share/
    mv configs/xdg_data_home/pass ~/.local/share/
    mv configs/.zshenv ~/
    mv configs/xdg_config_home/zathura ~/.config/
    mv configs/xdg_config_home/zsh ~/.config/
    if [ -e ~/.cache ]; then
      mv configs/xdg_cache_home/zsh ~/.cache/
    else
      mkdir ~/.cache
      mv configs/xdg_cache_home/zsh ~/.cache/
    fi
    echo

    # Instala mi tema personal de Gnome 40
    printf "${GREEN}${BOLD}Instalando mi tema de gnome-shell${NC}\n"
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
    printf "${GREEN}${BOLD}Moviendo wallpapers${NC}\n"
    sleep 1
    mv configs/wallpapers/*.* ~/Imágenes
    echo
    printf "${GREEN}${BOLD}La tercera parte del script ha finalizado${NC}\n"
    sleep 1
    printf "${GREEN}${BOLD}Reinicie la computadora para ver todos los cambios${NC}\n"
    ;;
  n)
    printf "Ha cancelado la operación\n"
    ;;
  *)
    printf "${RED}${BOLD}Esa opción no es válida${NC}\n"
    sleep 1
    ;;
esac
