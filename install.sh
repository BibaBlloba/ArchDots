#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
PURPLE='\033[0;35m'
SCRIPTDIR=$(pwd)

# Enable multilib
# echo -e "${RED}Enable multilib...${NC}"
# sleep 3
# sudo mv /etc/pacman.conf /etc/pacman.conf.bak
# sudo cp pacman.conf /etc/

# Main pakages
echo -e "${RED}Installing main pakages...${NC}"
sleep 3
sudo pacman -Syu
sudo pacman -S git sudo firefox kitty neovim waybar neofetch btop wpaperd hyprlock thunar os-prober sddm fish unzip imw
chsh -s /bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | omf install bobthefish | fish

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Copy dotfiles
echo -e "${RED}Copy dotfiles...${NC}"
sleep 3
sudo cp -rf hypr ~/.config/
sudo cp hypr/* ~/.config/hypr/
sudo cp -rf waybar ~/.config/
sudo cp waybar/* ~/.config/waybar/
sudo cp -rf neofetch ~/.config/
sudo cp neofetch/* ~/.config/neofetch/
sudo cp -rf kitty ~/.config/
sudo cp -rf fish ~/.config/
sudo cp -rf fish/* ~/.config/fish/
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

# Setting up Astronvim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Fonts
echo -e "${RED}Fonts...${NC}"
mkdir fonts/nerd-fonts -p
cd fonts/nerd-fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
cd SCRIPTDIR
sudo cp -rf fonts ~/.local/share/
fc-cache

echo -e "${RED}Not forget to set up Grub wallpapers in ${PURPLE}/etc/default/grub"
echo -e "${PURPLE}sudo grub-mkconfig -o /boot/grub/grub.cfg"
echo -e "${RED}And hyprland monitors${NC}"
