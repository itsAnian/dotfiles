{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs;[
#aylurs-gtk-shell-git
    wireplumber
      libgtop
      bluez
#bluez-utils
      networkmanager
      dart-sass
      wl-clipboard
      upower
      gvfs
  ];

  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;

# Enable the module.
# Default: false
  };
}
