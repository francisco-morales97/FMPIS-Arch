#!/bin/bash

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
      # Desarrollo web --
      'firefox'
      'chromium'
      'epiphany'
      'code'
      'inkscape'
      'gimp'
      'mysql-workbench'
      'scribus'
      'vim'

      # Mensajería --
      'geary'

      # Aplicaciones favoritas --
      'alacritty'
      'lollypop'

      # Emuladores --
      'dolphin-emu'

      # Escritura con groff --
      'zathura'
      'zathura-pdf-poppler'
      'zathura-ps'

      # Utilidades --
      'flatpak'
      'gnome-calendar'
      'gnome-calculator'
      'gnome-screenshot'
      'gnome-software'
      'gnome-usage'
      'file-roller'
      'evince'
      'sushi'
      'eog'
      'tlp'
      'mpv'
      'youtube-dl'
      'transmission-gtk'
      'gufw'
      'htop'
      'dash'
      'zsh'
      'zsh-syntax-highlighting'
      'zsh-autosuggestions'
      'zsh-completions'
    )
    sudo pacman -S "${PROGRAMAS_PAC[*]}" --noconfirm --needed
    echo ""

    # Instalación de programas con flatpak
    echo "Instalación de programas con flatpak"
    sleep 1
    PROGRAMAS_FLAT=(
      # Desarrollo web --
      'io.github.Figma_Linux.figma_linux'
      'com.getpostman.Postman'
      'net.xmind.ZEN'

      # Aplicaciones favoritas --
      'com.spotify.Client'
      'com.stremio.Stremio'
        
      # Emuladores --
      'org.libretro.RetroArch'
        
      # Ofimatica --
      'com.wps.Office'
      'org.onlyoffice.desktopeditors'

      # Utilidades --
      'com.github.tchx84.Flatseal'
      'com.github.alainm23.planner'
    )
    sudo flatpak install -y --noninteractive "${PROGRAMAS_FLAT[*]}"
    echo ""

    # Instalación de programas con Yay
    echo "Instalación de programas con yay (AUR)"
    sleep 1
    PROGRAMAS_AUR=(
      # Desarrollo web --
      'xampp'

      # Fuentes tipograficas --
      'ttf-ms-fonts'
      'nerd-fonts-roboto-mono'

      # Utilidades --
      'zsh-theme-powerlevel10k-git'
      'auto-cpufreq-git'
    )
    yay -S --noconfirm "${PROGRAMAS_AUR[*]}"
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
