{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
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
    ./rofi.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = "~/.config/hypr/monitors.conf";

      "$terminal" = "kitty";
      "$browser" = "brave";
      "$browser-incognito" = "brave --incognito";
      "$discord" = "vesktop";
      "$fileManager" = "nemo";
      "$menu" = "rofi -show drun -drun-display-format {name}";

      exec-once = [
        "hypridle &"
        "wpaperd"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
        "col.active_border" = "rgba(a7c080ff)";
        "col.inactive_border" = "rgba(4b565c99)";
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
          enabled = false;
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
          disable_while_typing = false;
          middle_button_emulation = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, B, exec, $browser"
        "$mainMod SHIFT, B, exec, $browser-incognito"
        "$mainMod, D, exec, $discord"
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
        "$mainMod, F, fullscreen, 1"
        "$mainMod SHIFT, F, fullscreen, 0"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, left, movetoworkspace, r-1"
        "$mainMod SHIFT, right, movetoworkspace, r+1"
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
      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
    };
  };
}
