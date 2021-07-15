#!/bin/sh

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

# Comienza el script
echo "¿Quiere iniciar la segunda parte del script? [y/n]"
read ANSWER
case "$ANSWER" in
  y)  
    echo "Esto puede tardar unos minutos..."
    sleep 1
    echo ""

    # Instalación de programas con pacman
    echo "Instalación de programas con pacman"
    sleep 1
    PROGRAMAS_PAC=(
      # Desarrollo web ---------------------------------------------
      'firefox'
      'chromium'
      'epiphany'
      'code'
      'inkscape'
      'gimp'
      'mysql-workbench'

      # Mensajería -------------------------------------------------
      'geary'

      # Aplicaciones favoritas -------------------------------------
      'alacritty'
      'lollypop'
      'signal-desktop'

      # Emuladores -------------------------------------------------
      'dolphin-emu'

      # Escritura con groff ----------------------------------------
      'zathura'
      'zathura-pdf-poppler'
      'zathura-ps'
      'vim'

      # Utilidades -------------------------------------------------
      'flatpak'
      'gnome-calendar'
      'gnome-calculator'
      'gnome-todo'
      'gnome-screenshot'
      'gnome-software'
      'file-roller'
      'evince'
      'sushi'
      'eog'
      'seahorse'
      'tlp'
      'totem'
      'transmission-gtk'
      'gufw'
      'cmatrix'
      'htop'
      'zsh'
      'zsh-completions'
    )
    for PROGRAMA_PAC in "${PROGRAMAS_PAC[@]}"; do
      echo ""
      echo -e "${BOLD}${GRENN}Instalando:${NC} ${PROGRAMA_PAC}"
      sleep 1
      sudo pacman -S "${PROGRAMA_PAC}" --noconfirm --needed
    done
    echo ""

    # Instalación de programas con flatpak
    echo "Instalación de programas con flatpak"
    sleep 1
    PROGRAMAS_FLAT=(
      # Desarrollo web ---------------------------------------------
      'io.github.Figma_Linux.figma_linux'
      'com.getpostman.Postman'

      # Aplicaciones favoritas -------------------------------------
      'com.spotify.Client'
      'com.stremio.Stremio'
        
      # Emuladores -------------------------------------------------
      'org.libretro.RetroArch'
        
      # Ofimatica --------------------------------------------------
      'com.wps.Office'
      'org.onlyoffice.desktopeditors'
      'com.microsoft.Teams'

      # Utilidades -------------------------------------------------
      'com.github.tchx84.Flatseal'
    )
    for PROGRAMA_FLAT in "${PROGRAMAS_FLAT[@]}"; do
      echo ""
      echo -e "${BOLD}${GREEN}Instalando:${NC} ${PROGRAMA_FLAT}"
      sleep 1
      sudo flatpak install -y --noninteractive "${PROGRAMA_FLAT}"
    done
    echo ""

    # Instalación de programas con Yay
    echo "Instalación de programas con yay (AUR)"
    sleep 1
    PROGRAMAS_AUR=(
      # Desarrollo web ---------------------------------------------
      'xmind-2020'
      'xampp'

      # Fuentes tipograficas ---------------------------------------
      'ttf-ms-fonts'
      'nerd-fonts-roboto-mono'

      # Utilidades -------------------------------------------------
      'zsh-theme-powerlevel10k-git'
      'auto-cpufreq-git'
      'vim-gruvbox-git'
      'vim-airline-gruvbox-git'
    )
    for PROGRAMA_AUR in "${PROGRAMAS_AUR[@]}"; do
      echo ""
      echo -e "${BOLD}${GREEN}Instalando:${NC} ${PROGRAMA_AUR}"
      sleep 1
      yay -S --noconfirm "${PROGRAMA_AUR}"
    done
    echo ""
    echo -e "${BOLD}${GREEN}La segunda parte del script ha finalizado${NC}"
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
