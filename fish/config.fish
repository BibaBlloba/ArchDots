if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  neofetch --image_size 250
end

set -g theme_color_scheme nord
set -g theme_display_date no

# alias neofetch='neofetch --source ~/.config/neofetch/art'
alias n='sudo -E -s nvim'
alias yt='yt-dlp'
alias ufw="sudo ufw"
alias neofetch="neofetch --image_size 250"
alias runc="g++ -o main main.cpp && ./main"
alias 120hz="hyprctl keyword monitor eDP-1,1920x1200@120,auto,1.5,"
alias 60hz="hyprctl keyword monitor eDP-1,1920x1200@60,auto,1.5,"
