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

  imports = [
    ./custom_theme.nix
      inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    overwrite.enable = true;
    theme = "dracula";

    layout = {
      "bar.layouts" = {
	"*" = {
	  left = [
	    "dashboard"
	      "workspaces"
	      "windowtitle"
	  ];
	  middle = [
	    "media"
	  ];
	  right = [
	    "volume"
	      "bluetooth"
	      "battery"
	      "network"
	      "clock"
	      "notifications"
	  ];
	};
      };
    };
    settings = {
      bar = {
	launcher.autoDetectIcon = true;

	clock = {
	  format = "%a %b %d  %H:%M";
	  icon = "󰸗";
	};
      };
      menus = {
	dashboard = {
	  powermenu = {
	    avatar.image = "~/dotfiles/hyprland/nix_icon_neonblue_transparent.png";
	    avatar.name = "itsAnian";
	  };
	  shortcuts.enabled = false;
	};
      };
    };
  };
}
