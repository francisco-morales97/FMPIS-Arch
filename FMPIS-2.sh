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
      'inkscape'
      'gimp'
      'neovim'
      'dolphin-emu'
      'zathura'
      'zathura-pdf-mupdf'
      'zathura-ps'
      'gst-libav'
      'gst-plugins-base'
      'kid3-common'
      'pacman-contrib'
      'tmux'
      'mtpfs'
      'gvfs-mtp'
      'flatpak'
      'gnome-calendar'
      'gnome-calculator'
      'gnome-console'
      'gnome-weather'
      'gnome-clocks'
      'gnome-font-viewer'
      'loupe'
      'pass'
      'xclip'
      'imagemagick'
      'wl-clipboard'
      'file-roller'
      'papers'
      'htop'
      'sushi'
      'ripgrep'
      'pass'
      'mpv'
      'yt-dlp'
      'transmission-gtk'
      'firewalld'
      'dash'
      'ttf-jetbrains-mono-nerd'
      'ttf-iosevkaterm-nerd'
      'zsh'
      'zsh-syntax-highlighting'
      'zsh-autosuggestions'
      'zsh-completions'
      'starship'
      'entr'
      'lsd'
      'bat'
      'mkvtoolnix-cli'
      'fzf'
      'vulkan-intel'
      'pavucontrol'
      'alacritty'
      'pastel'
      'emby-server'
      'stow'
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
      'io.bassi.Amberol'
      'org.libretro.RetroArch'
      'org.onlyoffice.desktopeditors'
      'com.github.tchx84.Flatseal'
      'app.zen_browser.zen'
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
      'ttf-ms-fonts'
      'game-devices-udev'
      'ani-cli'
      'mangal-bin'
      'nvm'
    )
    for PROGRAMA_AUR in "${PROGRAMAS_AUR[@]}"; do
      echo
      printf "Instalando: ${PROGRAMA_AUR}\n"
      sleep 1
      yay -S --noconfirm "${PROGRAMA_AUR}"
    done
    echo
    printf "${GREEN}${BOLD}La segunda parte del script ha finalizado${NC}\n"
    ;;
  n)
    printf "Ha cancelado la operación\n"
    ;;
  *)
    printf "${RED}${BOLD}Esa opción no es válida${NC}\n"
    sleep 1
    ;;
esac
