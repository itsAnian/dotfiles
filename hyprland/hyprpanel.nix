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
    systemd.enable = true;
    overwrite.enable = true;
    theme = "catppuccin_mocha";

    layout = {
      "bar.layouts" = {
	"*" = {
	  left = ["dashboard" "workspaces" "windowtitle"];
	  middle = ["media"];
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
    override = {
      "theme.bar.buttons.dashboard.icon" = "#2d81bf";
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
	    avatar.image = "~/dotfiles/hyprland/nix_icon.png";
	    avatar.name = "itsAnian";
	  };
	  shortcuts.enabled = false;
	};
      };
    };
  };
}
