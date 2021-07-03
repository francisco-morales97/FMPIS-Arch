#!/bin/sh

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

# Comienza el script
echo "¿Quiere iniciar la primera parte del script? [y/n]"
read ANSWER
case "$ANSWER" in
  y)  
    echo "Esto puede tardar unos minutos..."
    sleep 1
    echo ""
    echo "Configuraciones generales"
    sleep 1
    echo ""

    # Actualizar mirrors
    echo -e "${BOLD}${GREEN}Actualizando los mirrors${NC}"
    sleep 1
    sudo pacman -S reflector
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
    sudo reflector --verbose --score 100 -l 50 -f 10 --sort rate --save /etc/pacman.d/mirrorlist
    echo ""

    # Actualizar el sistema
    echo -e "${BOLD}${GREEN}Actualizando el sistema${NC}"
    sleep 1
    sudo pacman -Syyu
    echo ""

    # Instalar servicios útiles
    echo -e "${BOLD}${GREEN}Servicios útiles${NC}"
    sleep 1
    sudo pacman -S acpid ntp dbus cups cronie
    sudo systemctl enable acpid
    sudo systemctl enable ntpd
    sudo systemctl enable cups.service
    echo ""

    # Instalación mínima del escritorio Gnome
    echo -e "${BOLD}${GREEN}Instalando Gnome mínimo${NC}"
    sleep 1
    GNOME_PAQUETES=(
      'nano'
      'base-devel'
      'xf86-input-synaptics'
      'xdg-user-dirs'
      'gnome-shell'
      'nautilus'
      'gnome-terminal'
      'gnome-control-center'
      'gnome-tweak-tool'
      'gdm'
    )
    for GNOME_PAQUETE in "${GNOME_PAQUETES[@]}"; do
      echo ""
      echo -e "${BOLD}${GREEN}Instalando:${NC} ${GNOME_PAQUETE}"
      sleep 1
      sudo pacman -S "${GNOME_PAQUETE}" --noconfirm
    done
    sudo systemctl enable gdm
    echo ""

    # Instalación de Yay para usar el AUR
    echo -e "${BOLD}${GREEN}Instalando Yay${NC}"
    sleep 1
    git clone https://aur.archlinux.org/yay.git
    cd yay
    sudo makepkg -si
    echo ""

    # Ajustar el valor de swappiness
    echo -e "${BOLD}${GREEN}Ajustando swappiness${NC}"
    sleep 1
    sudo touch /etc/sysctl.d/99-swappiness.conf
    echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-swappiness.conf
    echo ""
    echo -e "${BOLD}${GREEN}La primera parte del script ha finalizado${NC}"
    sleep 1
    echo -e "${BOLD}${GREEN}Reinicie la computadora antes de iniciar la segunda parte${NC}"
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
