if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  neofetch
end

set -g theme_color_scheme nord
set -g theme_display_date no

# alias neofetch='neofetch --source ~/.config/neofetch/art'
alias n='sudo -E -s nvim'
alias yt='yt-dlp'
alias myserv='ssh user@192.168.246.19 -p 7562'
alias ufw="sudo ufw"
