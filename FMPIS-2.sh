#!/bin/bash

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

# Comienza el script
printf "¿Quiere iniciar la segunda parte del script? [y/n]\n"
read ANSWER
case "$ANSWER" in
  y)  
    printf "Esto puede tardar unos minutos...\n"
    sleep 1
    echo

    # Instalación de programas con pacman
    printf "Instalación de programas con pacman\n"
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

      # Codecs OGG para GStreamer --
      'gst-libav'
      'gst-plugins-base'

      # Utilidades --
      'pacman-contrib'
      'mtpfs'
      'gvfs-mtp'
      'flatpak'
      'gnome-calendar'
      'gnome-calculator'
      'gnome-screenshot'
      'gnome-software'
      'gnome-software-packagekit-plugin'
      'gnome-usage'
      'gnome-photos'
      'pass'
      'xclip'
      'file-roller'
      'evince'
      'sushi'
      'pass'
      'eog'
      'mpv'
      'yt-dlp'
      'transmission-gtk'
      'gufw'
      'htop'
      'ttf-iosevka-nerd'
      'dash'
      'zsh'
      'zsh-syntax-highlighting'
      'zsh-autosuggestions'
      'zsh-completions'
    )
    for PROGRAMA_PAC in "${PROGRAMAS_PAC[@]}"; do
      echo
      printf "Instalando: ${PROGRAMA_PAC}\n"
      sleep 1
      sudo pacman -S "${PROGRAMA_PAC}" --noconfirm --needed
    done
    echo

    # Instalación de programas con flatpak
    printf "Instalación de programas con flatpak\n"
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
      'com.microsoft.teams'

      # Utilidades --
      'com.github.tchx84.Flatseal'
      'com.github.alainm23.planner'
    )
    for PROGRAMA_FLAT in "${PROGRAMAS_FLAT[@]}"; do
      echo
      printf "Instalando: ${PROGRAMA_FLAT}\n"
      sleep 1
      sudo flatpak install -y --noninteractive "${PROGRAMA_FLAT}"
    done
    echo

    # Instalación de programas con Yay
    printf "Instalación de programas con yay (AUR)\n"
    sleep 1
    PROGRAMAS_AUR=(
      # Desarrollo web --
      'xampp'

      # Fuentes tipograficas --
      'ttf-ms-fonts'

      # Utilidades --
      'opustags'
      'game-devices-udev'
      'zsh-theme-powerlevel10k-git'
      'auto-cpufreq'
    )
    for PROGRAMA_AUR in "${PROGRAMAS_AUR[@]}"; do
      echo
      printf "Instalando: ${PROGRAMA_AUR}\n"
      sleep 1
      yay -S --noconfirm "${PROGRAMA_AUR}"
    done
    echo
    printf "${BOLD}${GREEN}La segunda parte del script ha finalizado${NC}\n"
    ;;
  n)
    printf "Ha cancelado la operación\n"
    ;;
  *)
    printf "${BOLD}${RED}Esa opción no es válida${NC}\n"
    sleep 1
    ;;
esac
