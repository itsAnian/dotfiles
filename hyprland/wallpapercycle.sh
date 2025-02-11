#!/usr/bin/env sh

while true
do
WALLPAPER_DIR="$HOME/dotfiles/hyprland/wallpaper/"
CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALLPAPER")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1, $WALLPAPER"
hyprctl hyprpaper unload "$CURRENT_WALLPAPER"
sleep 5m 
done
