{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    networkmanagerapplet
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./waybar.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 10;
        margin-bottom = 4;
        margin-left = 10;
        margin-right = 10;
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = ["mpris"];
        modules-right = [
          "pulseaudio"
          "network"
          "bluetooth"
          "battery"
          "clock"
        ];
        font = "JetBrainsMono Nerd Font 13";

        mpris = {
          format = "{player_icon} {artist} - {title}";
          format-paused = " {artist} - {title}";
          format-stopped = "";
          max-length = 40;
          interval = 2;
          player-icons = {
            default = "";
            spotify = "";
            vlc = "󰕼";
            firefox = "";
          };
          tooltip = true;
          tooltip-format = "{position} / {length}";
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-click-middle = "playerctl previous";
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
        };

        clock = {
          tooltip = false;
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          actions = {
            on-click-right = "mode";
          };
        };

        battery = {
          interval = 5;
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{capacity}%{icon}";
          format-charging = "{capacity}%󰂄";
          format-plugged = "{capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon}{volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = " {icon}  {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}%";
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            headset = "󰋎 ";
            default = ["" " " " "];
          };
          on-click = "pavucontrol";
          tooltip = false;
        };

        network = {
          format = "{icon}{essid}";
          max-length = 15;
          format-wifi = "{icon}{essid}";
          format-ethernet = "{icon}";
          format-disconnected = "{icon}";
          format-icons = {
            wifi = ["󰤩 " "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
            ethernet = "󰈁";
            disconnected = "󰤭 ";
          };
          tooltip = true;
          tooltip-format = "󰕒: {bandwidthUpBytes}\n󰇚: {bandwidthDownBytes}";
          tooltip-format-wifi = "SSID: {essid}\nSignal: {signalStrength}%\n󰕒: {bandwidthUpBytes}\n󰇚: {bandwidthDownBytes}\n󰤨 : {bandwidthTotalBytes}";
          tooltip-format-ethernet = "󰕒: {bandwidthUpBytes}\n󰇚: {bandwidthDownBytes}\n󰤨 : {bandwidthTotalBytes}";
          # on-click = "nm-applet";
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "󰂲";
          format-off = "";
          format-on = "";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";

          tooltip-format = "{controller_alias} ({controller_address})\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias} ({controller_address})\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias} - {device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias} - {device_address} - {device_battery_percentage}%";

          # on-click = "blueman-manager";
          # on-click-right = "bluetoothctl power off";
          # on-scroll-up = "bluetoothctl discoverable on";
          # on-scroll-down = "bluetoothctl discoverable off";
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
            urgent = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };

        "niri/window" = {
          format = "{app_id}";
          max-length = 25;
          tooltip = true;
          tooltip-format = "{title}";
        };
      };
    };
  };
}
