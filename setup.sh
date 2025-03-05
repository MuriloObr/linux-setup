#!/bin/bash

BLACK="\e[30m"      # Texto preto
RED="\e[31m"        # Texto vermelho
GREEN="\e[32m"      # Texto verde
YELLOW="\e[33m"     # Texto amarelo
BLUE="\e[34m"       # Texto azul
MAGENTA="\e[35m"    # Texto magenta
CYAN="\e[36m"       # Texto ciano
WHITE="\e[37m"      # Texto branco

BOLD_BLACK="\e[1;30m"   # Texto preto em negrito
BOLD_RED="\e[1;31m"     # Texto vermelho em negrito
BOLD_GREEN="\e[1;32m"   # Texto verde em negrito
BOLD_YELLOW="\e[1;33m"  # Texto amarelo em negrito
BOLD_BLUE="\e[1;34m"    # Texto azul em negrito
BOLD_MAGENTA="\e[1;35m" # Texto magenta em negrito
BOLD_CYAN="\e[1;36m"    # Texto ciano em negrito
BOLD_WHITE="\e[1;37m"   # Texto branco em negrito

RESET="\e[0m"       # Resetar todas as formatações

colored_print() {
  local color="$1"
  local text="$2"
  echo -e "${color}${text}${RESET}"
}

# Check for arguments

if [ $# -ne 1 ]; then
    colored_print "$RED" "Error: You need to provide exactly one argument."
    colored_print "$RED" "Usage: $0 <option>"
    colored_print "$RED" "Allowed options: opt1, opt2"
    exit 1
fi

setup=$1

if [[ "$1" != "nvim" && "$1" != "full" ]]; then
    colored_print "$RED" "Error: Invalid option '$1'."
    colored_print "$RED" "Allowed options: nvim, full"
    exit 1
fi

colored_print "$GREEN" "You selected $setup setup"

# Check for system distro (only checks for arch or debian based)

colored_print "$BOLD_YELLOW" "Checking for package manager"

distro=$(cat /etc/os-release | grep -m1 ID | cut -d '=' -f 2)
pacman_exist=$(which pacman)

if [[ $pacman_exist == "/usr/sbin/pacman" ]]; then
  package_manager="pacman"
else
  package_manager="apt"
fi

sleep 1

colored_print "$YELLOW" "You are using $distro linux"
colored_print "$CYAN" "Your package manager is $package_manager"

echo

colored_print "$YELLOW" "Would you like to start setup? (y/n)"

read start_setup

if [[ $start_setup == "y" ]]; then
  if [[ $package_manager ==  "pacman" ]]; then
    colored_print "$GREEN" "Starting setup..."

    sleep 2

    colored_print "$BOLD_YELLOW" "Installing packages..."
    if [[ $setup == "nvim" ]]; then
      sudo pacman -S --noconfirm neovim
    else
      sudo pacman -S --noconfirm neovim ttf-jetbrains-mono-nerd starship
    
  else
    colored_print "$GREEN" "Starting setup..."

    sleep 2
  fi
else
  colored_print "$RED" "Setup finished!"
fi

