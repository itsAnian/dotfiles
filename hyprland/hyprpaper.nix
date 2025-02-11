{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs;[
    hyprpaper #wallpaper
  ];
  services.hyprpaper ={
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
	"~/dotfiles/hyprland/wallpaper/hyprland_contest2.png"
      ];

      wallpaper = [
	"eDP-1, ~/dotfiles/hyprland/wallpaper/hyprland_contest2.png"
      ];
    };
  };
}
