if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  neofetch --source /home/akeka/.config/neofetch/nyarch.png --image_size 230
end

set -g theme_color_scheme nord
set -g theme_display_date no

# alias neofetch='neofetch --source ~/.config/neofetch/art'
alias n='nvim ./'
alias yt='yt-dlp'
alias ufw="sudo ufw"
alias neofetch="neofetch --image_size 250"
alias runc="g++ -o main main.cpp && ./main"
alias 120hz="hyprctl keyword monitor eDP-1,1920x1200@120,auto,1.5,"
alias 60hz="hyprctl keyword monitor eDP-1,1920x1200@60,auto,1.5,"
alias k="kubectl"
alias l="lazygit"
alias dr="dotnet run"

function mkcd
  mkdir -p $argv
  cd $argv
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function VirtualMicro
	pw-loopback --capture-props='media.class=Audio/Source/Virtual node.name=MainMicro' --playback-props='media.class=Audio/Sink'
end
