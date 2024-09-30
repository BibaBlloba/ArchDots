#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
PURPLE='\033[0;35m'
PACKAGES=("git" "sudo" "firefox" "kitty" "neovim" "waybar" "neofetch" "btop" "wpaperd" "hyprlock" "thunar" "os-prober" "sddm" "fish" "unzip" "imw" "dunst" "wlsunset" "wlsunset" "pavucontrol" "hypridle" "udiskie" "slurp" "grim" "lazygit" "wl-clipboard" "imagemagick" "mpv")

clear

# Enable multilib
# echo -e "${RED}Enable multilib...${NC}"
# sleep 3
# sudo mv /etc/pacman.conf /etc/pacman.conf.bak
# sudo cp pacman.conf /etc/

# Main pakages
echo -e "${RED}Installing main pakages...${NC}"
sleep 3
sudo pacman -Syu

for package in "${PACKAGES[@]}"; do
	sudo pacman -S --needed --noconfirm "$package"
done

git config --global credential.helper store
git config credential.helper 'cache --timeout=900'

chsh -s /bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | omf install bobthefish

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
sudo cp -rf dunst ~/.config/

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
cd ../../
sudo cp -rf fonts ~/.local/share/
fc-cache

# Rofi
yay -S rofi-wayland
sudo cp -rf rofi1/* ~/.config/rofi/
yay -S rofi-power-menu

sudo cp -rf ./rofiThemes /home/keka/.local/share/rofi
sudo cp -rf ./rounded-common.rasi /home/keka/

# Sddm
sudo cp ./sddm/sddm.conf /etc/
sudo cp -rf ./sddm/sddm-astronaut-theme /usr/share/sddm/themes/

echo -e "${RED}Not forget to set up Grub wallpapers in ${PURPLE}/etc/default/grub"
echo -e "${PURPLE}sudo grub-mkconfig -o /boot/grub/grub.cfg"
echo -e "${RED}And hyprland monitors${NC}"
echo -e "${RED}Install blahaj (Optional)${NC}"
