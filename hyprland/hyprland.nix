{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs;[
    dunst
      libnotify
      networkmanagerapplet
      hyprshot
      brightnessctl
  ];

  imports = [
    ./hyprpanel.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./wpaperd.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
	"eDP-1, highres, auto, 1"
	"HDMI-A-1, highres, auto, 1, mirror, eDP-1"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "superfile";
      "$menu" = "rofi -show drun";

      exec-once = [
	"hypridle &"
	"hyprpanel &"
        "wpaperd &"
	"sleep 2 && hyprctl dispatch workspace 2 && brave &"
	"sleep 4 && hyprctl dispatch workspace 1 && kitty &"
      ];

      /*env = {
	"XCURSOR_SIZE" = "24";
	"HYPRCURSOR_SIZE" = "24";
	};*/

      general = {
	gaps_in = 5;
	gaps_out = 20;
	border_size = 2;
	"col.active_border" = "rgba(33ccffee)";
	"col.inactive_border" = "rgba(595959aa)";
	resize_on_border = false;
	allow_tearing = false;
	layout = "dwindle";
      };

      decoration = {
	rounding = 10;
	active_opacity = 1.0;
	inactive_opacity = 1.0;
#drop_shadow = true;
#shadow_range = 4;
#shadow_render_power = 3;
#"col.shadow" = "rgba(1a1a1aee)";
	blur = {
	  enabled = true;
	  size = 3;
	  passes = 1;
	  vibrancy = 0.1696;
	};
      };

      animations = {
	enabled = true;
	bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
	animation = [
	  "windows, 1, 7, myBezier"
	    "windowsOut, 1, 7, default, popin 80%"
	    "border, 1, 10, default"
	    "borderangle, 1, 8, default"
	    "fade, 1, 7, default"
	    "workspaces, 1, 6, default"
	];
      };

      input = {
	kb_layout = "de";
	follow_mouse = 1;
	sensitivity = 0;
	touchpad = {
	  natural_scroll = true;
	};
      };

      gestures = {
	workspace_swipe = true;
      };

      misc = {
	force_default_wallpaper = -1;
	disable_hyprland_logo = false;
      };

      "$mainMod" = "SUPER";

      bind = [
	"$mainMod, Q, exec, $terminal"
	  "$mainMod, C, killactive,"
	  "$mainMod, M, exit,"
	  "$mainMod, E, exec, $fileManager"
	  "$mainMod, V, togglefloating,"
	  "$mainMod, R, exec, $menu"
	  "$mainMod, P, pseudo,"
	  "$mainMod, J, togglesplit,"
	  "$mainMod, left, movefocus, l"
	  "$mainMod, right, movefocus, r"
	  "$mainMod, up, movefocus, u"
	  "$mainMod, down, movefocus, d"
	  "$mainMod, L, exec, hyprlock --immediate"
	  "$mainMod, S, exec, hyprshot -m region --clipboard-only"
      ];

      bindm = [
	"$mainMod, mouse:272, movewindow"
	  "$mainMod ALT, mouse:272, resizewindow"
      ];

      bindel = [
	",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      windowrulev2 = "suppressevent maximize, class:.*";
    };
  };
}
