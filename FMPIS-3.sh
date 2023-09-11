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
    mv configs/.zshenv ~/
    mv configs/bin ~/.local/
    mv -f configs/xdg_config_home/* ~/.config/
    mv -f configs/xdg_data_home/* ~/.local/share/
    if [ -e ~/.cache ]; then
      mv -f configs/xdg_cache_home/* ~/.cache/
    else
      mkdir ~/.cache
      mv -f configs/xdg_cache_home/* ~/.cache/
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
