#!/bin/bash

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

# Comienza el script
echo "¿Quiere iniciar la tercera parte del script? [y/n]"
read ANSWER
case "$ANSWER" in
  y)
    echo ""
    echo "Iniciando personalización del sistema operativo"
    sleep 1
    echo ""

    # Cambia el symlink de sh por dash
    echo -e "${BOLD}${GREEN}Creando symlink de dash para sh${NC}"
    sleep 1
    sudo ln -sfT /bin/dash /bin/sh
    readlink /bin/sh
    echo ""

    # Configura ZSH como el shell por defecto
    echo -e "${BOLD}${GREEN}Cambiando bash por zsh${NC}"
    sleep 1
    sudo chsh -s /bin/zsh
    echo ""

    # Inicia el servicio de Auto CPU-Freq
    echo -e "${BOLD}${GREEN}Iniciando Auto CPU-Freq${NC}"
    sleep 1
    sudo systemctl enable --now auto-cpufreq
    sudo auto-cpufreq --live
    echo ""

    # Mueve archivos de configuración a sus ubicaciones correspondientes
    echo -e "${BOLD}${GREEN}Instalando mis configuraciones${NC}"
    sleep 1
    mv configs/alacritty ~/.config
    mv configs/bin ~/.local
    mv configs/zathura ~/.config
    mv configs/.vim ~/
    mv configs/.vimrc ~/
    echo ""

    # Instala mi tema personal de Gnome 40
    echo -e "${BOLD}${GREEN}Instalando mi tema de gnome-shell${NC}"
    sleep 1
    if [ -e ~/.themes ]; then
      git clone https://github.com/fMorales-97/Fradwaita.git
      mv Fradwaita ~/.themes
    else
      mkdir ~/.themes
      git clone https://github.com/fMorales-97/Fradwaita.git
      mv Fradwaita ~/.themes
    fi
    echo ""

    # Mueve mis wallpapers a la carpeta de imágenes
    echo -e "${BOLD}${GREEN}Moviendo wallpapers${NC}"
    sleep 1
    mv configs/wallpapers/*.* ~/Imágenes
    echo ""

    # Añade Powerlevel10k al archivo zshrc
    echo -e "${BOLD}${GREEN}Iniciando Powerlevel10k${NC}"
    echo "source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
    echo ""
    echo -e "${BOLD}${GREEN}La segunda parte del script ha finalizado${NC}"
    sleep 1
    echo -e "${BOLD}${GREEN}Reinicie la computadora para ver todos los cambios${NC}"
    sleep 1
    ;;
  n)
    echo "Ha cancelado la operación"
    sleep 1
    ;;
  *)
    echo -e "${BOLD}${RED}Esa opción no es válida${NC}"
    sleep 1
    ;;
esac
