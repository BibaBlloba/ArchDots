#!/bin/bash

ps cax | grep waybar > /dev/null
if [ $? -eq 0 ]; then
  pkill waybar
else
  hyprctl dispatch exec waybar
fi
