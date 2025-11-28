#!/bin/bash

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

# Comienza el script
printf "¿Quiere iniciar la primera parte del script? [y/n]\n"
read ANSWER
case "$ANSWER" in
  y)  
    printf "Esto puede tardar unos minutos...\n"
    sleep 1
    echo

    # Actualizar mirrors
    printf "${GREEN}${BOLD}Actualizando los mirrors${NC}\n"
    sleep 1
    sudo pacman -S reflector
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
    sudo reflector --verbose --score 100 -l 50 -f 10 --sort rate --save /etc/pacman.d/mirrorlist
    echo

    # Actualizar el sistema
    printf "${GREEN}${BOLD}Actualizando el sistema${NC}\n"
    sleep 1
    sudo pacman -Syyu
    sudo pacman -Sy archlinux-keyring
    echo

    # Instalar servicios útiles
    printf "${GREEN}${BOLD}Servicios útiles${NC}\n"
    sleep 1
    sudo pacman -S acpid ntp dbus cups cronie pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire wireplumber
    sudo systemctl enable acpid
    sudo systemctl enable ntpd
    sudo systemctl enable cups.service
    echo

    # Instalación mínima del escritorio Gnome
    printf "${GREEN}${BOLD}Instalando Gnome mínimo${NC}\n"
    sleep 1
    GNOME_PAQUETES=(
      'xdg-user-dirs'
      'gnome-shell'
      'gnome-console'
      'nautilus'
      'gnome-control-center'
      'gnome-tweak-tool'
      'gdm'
      'stow'
    )
    for GNOME_PAQUETE in "${GNOME_PAQUETES[@]}"; do
      echo
      printf "Instalando: ${GNOME_PAQUETE}\n"
      sleep 1
      sudo pacman -S "${GNOME_PAQUETE}" --noconfirm
    done
    sudo systemctl enable gdm
    xdg-user-dirs-update
    echo

    # Instalación de Yay para usar el AUR
    printf "${GREEN}${BOLD}Instalando Yay${NC}\n"
    sleep 1
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo

    # Ajustar el valor de swappiness
    printf "${GREEN}${BOLD}Ajustando swappiness${NC}\n"
    sleep 1
    printf "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-swappiness.conf
    echo

    # Habilitar servicio de bluetooth
    printf "${GREEN}${BOLD}Habilitando servicio de bluetooth${NC}\n"
    sleep 1
    sudo systemctl enable bluetooth.service
    echo "options ath9k btcoex_enable=1" | sudo tee /etc/modprobe.d/ath9k.conf
    echo
    printf "${GREEN}${BOLD}La primera parte del script ha finalizado${NC}\n"
    sleep 1
    printf "${GREEN}${BOLD}Reinicie la computadora y clone los dotfiles antes de iniciar la segunda parte${NC}\n"
    ;;
  n)
    printf "Ha cancelado la operación\n"
    ;;
  *)
    printf "${RED}${BOLD}Esa opción no es válida${NC}\n"
    sleep 1
    ;;
esac
