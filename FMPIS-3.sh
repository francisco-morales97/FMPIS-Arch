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
