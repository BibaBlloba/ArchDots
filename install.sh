#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
PURPLE='\033[0;35m'

# Enable multilib
echo -e "${RED}Enable multilib...${NC}"
sleep 3
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp pacman.conf /etc/

# Main pakages
echo -e "${RED}Installing main pakages...${NC}"
sleep 3
sudo pacman -Syu --noconfirm git sudo firefox kitty neovim waybar neofetch btop wpaperd hyprlock hyprshot thunar os-prober sddm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Copy dotfiles
echo -e "${RED}Copy dotfiles...${NC}"
sleep 3
sudo cp -rf hypr ~/.config/
sudo cp -rf waybar ~/.config/
sudo cp -rf neofetch ~/.config/
sudo cp -rf kitty ~/.config/
sudo cp -rf fish ~/.config/
sudo cp -rf wpaperd ~/.config/

mkdir ~/Documents
sudo cp -rf wallpapers ~/Documents/
sudo cp -rf GrubWallpapers ~/Documents/

# Setting up Grub
echo -e "${RED}Setting up Grub...${NC}"
sleep 3
sudo mv /etc/default/grub /etc/default/grub.bak
sudo cp grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${RED}Not forget to set up Grub wallpapers in ${PURPLE}/etc/default/grub"
echo -e "${PURPLE}sudo grub-mkconfig -o /boot/grub/grub.cfg"
echo -e "${RED}And hyprland monitors"
