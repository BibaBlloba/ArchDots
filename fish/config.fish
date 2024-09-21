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
