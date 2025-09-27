{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./waybar.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = ["clock"];
        modules-right = [
          "pulseaudio"
          "network"
          "bluetooth"
          "battery"
        ];
        font = "JetBrainsMono Nerd Font 13";

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
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip = true;
        };

        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = " {icon}  {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";
          format-icons = {
            headphone = "";
            headset = "󰋎";
            default = ["" "" ""];
          };
          on-click = "sleep 0.1 && pavucontrol";
          tooltip = false;
        };

        network = {
          format = "{icon} ";
          format-wifi = "{icon} ";
          format-ethernet = "{icon} ";
          format-disconnected = "{icon} ";
          format-icons = {
            wifi = ["󰤩" "󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
            ethernet = "󰈁";
            disconnected = "󰤭";
          };
          tooltip = true;
          tooltip-format = "󰕒: {bandwidthUpBytes}\n󰇚: {bandwidthDownBytes}";
          tooltip-format-wifi = "SSID: {essid}\nSignal: {signalStrength}%\n󰕒: {bandwidthUpBytes}\n󰇚: {bandwidthDownBytes}\n󰤨: {bandwidthTotalBytes}";
          tooltip-format-ethernet = "󰕒: {bandwidthUpBytes}\n󰇚: {bandwidthDownBytes}\n󰤨: {bandwidthTotalBytes}";
          on-click = "sleep 0.1 && nm-applet";
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "󰂲 ";
          format-off = " ";
          format-on = " ";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";

          tooltip-format = "{controller_alias} ({controller_address})\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias} ({controller_address})\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias} - {device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias} - {device_address} - {device_battery_percentage}%";

          on-click = "blueman-manager";
          on-click-right = "bluetoothctl power off";
          on-scroll-up = "bluetoothctl discoverable on";
          on-scroll-down = "bluetoothctl discoverable off";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
            urgent = "󰨡";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
          };
        };

        "hyprland/window" = {
          format = "{title}";
          max-length = 25;
          tooltip = true;
          tooltip-format = "{title}";
          rewrite = {
            "(.*) - Brave" = "$1";
          };
        };
      };
    };
  };
}
