{ config, pkgs, inputs, ... }:
{
    programs.wpaperd = {
        enable = true;
        settings = {
            eDP-1 = {
                path = "~/dotfiles/hyprland/wallpaper/";
                duration = "5m";
                random = true;
                unique = true;
                apply-shadow = true;
            };
        };
    };
}
