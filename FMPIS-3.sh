#!/bin/sh

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

    # Inicia el servicio de Auto CPU-Freq
    echo -e "${BOLD}${GREEN}Iniciando Auto CPU-Freq"
    sleep 1
    sudo systemctl start auto-cpufreq
    sudo systemctl enable auto-cpufreq
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

    # Instala mi tema personal de Gnome 3.38
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

    # Corrige la paleta de colores de Gruvbox en vim
    echo -e "${BOLD}${GREEN}Corrección de colores de Gruvbox${NC}"
    sleep 1
    echo "source /usr/share/vim/vimfiles/gruvbox_256palette.sh" >> ~/.zshrc
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
