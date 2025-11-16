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
      'adw-gtk-theme'
      'alacritty'
      'amberol'
      'bat'
      'dash'
      'decibels'
      'dolphin-emu'
      'emby-server'
      'entr'
      'file-roller'
      'firewalld'
      'flatpak'
      'fzf'
      'gimp'
      'gnome-backgrounds'
      'gnome-calculator'
      'gnome-calendar'
      'gnome-clocks'
      'gnome-font-viewer'
      'gnome-weather'
      'gst-libav'
      'gst-plugins-base'
      'gvfs-mtp'
      'htop'
      'imagemagick'
      'inkscape'
      'loupe'
      'lsd'
      'mkvtoolnix-cli'
      'mpv'
      'mtpfs'
      'neovim'
      'pacman-contrib'
      'papers'
      'pass'
      'pastel'
      'pavucontrol'
      'ripgrep'
      'sigil'
      'starship'
      'stow'
      'thunderbird'
      'tmux'
      'transmission-gtk'
      'ttf-iosevkaterm-nerd'
      'ttf-jetbrains-mono-nerd'
      'vulkan-intel'
      'wl-clipboard'
      'yt-dlp'
      'zsh'
      'zsh-autosuggestions'
      'zsh-completions'
      'zsh-syntax-highlighting'
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
      # 'io.bassi.Amberol'
      # 'org.libretro.RetroArch'
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
      'emulationstation-de'
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
