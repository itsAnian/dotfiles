{pkgs, ...}: let
  list-niri-windows = pkgs.writeShellScriptBin "list-niri-windows" ''
    #!/usr/bin/env bash
    INTERVAL=0.1
    set -euo pipefail

    while true; do
    FOCUSED_WS_ID=$(niri msg -j workspaces | jq '.[] | select(.is_focused == true) | .id')

    if [ -z "$FOCUSED_WS_ID" ]; then
      echo '{"text": ""}'
    fi

    mapfile -t original_array < <(
      niri msg -j windows | jq -r --argjson id "$FOCUSED_WS_ID" '
        [
          .[]
          | select(
              .workspace_id == $id and
              .layout.pos_in_scrolling_layout != null
            )
        ]
        | sort_by(.layout.pos_in_scrolling_layout)
        | .[]
        | .app_id, .is_focused // .title
      '
    )

    if [ ''${#original_array[@]} -eq 0 ]; then
        echo '{"text": ""}'
    fi

    final_text=""
    shopt -s nocasematch

    COLOR_UNFOCUSED=#A0A0A0
    COLOR_FOCUSED=#FFFFFF

    for (( i=0; i < ''${#original_array[@]}; i+=2 )); do
      app_name="''${original_array[$i]}"
      is_focused="''${original_array[$i+1]}"

    #   󰨈 󰅏 
      case "$app_name" in
        *"brave"*) icon=" " ;;
        *"kitty"*) icon=" " ;;
        *"vesktop"*) icon=" " ;;
        *"spotify"*) icon=" " ;;
        *"signal"*) icon=" " ;;
        *"zapzap"*) icon="󰖣 " ;;
        *"obsidian"*) icon=" " ;;
        *"gimp"*) icon=" " ;;
        *"libreoffice"*) icon="󰅏" ;;
        *) icon=" " ;;
      esac

      if [ "$is_focused" = "true" ]; then
        color="$COLOR_FOCUSED"
      else
        color="$COLOR_UNFOCUSED"
      fi

      final_text+="<span foreground=\"$color\">$icon</span> "
    done

    shopt -u nocasematch
    jq -c -n \
      --arg text "''${final_text% }" \
      '{text: $text}'
    sleep $INTERVAL
    done
  '';
in {
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    networkmanagerapplet
    jq
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
          "custom/windowlist"
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
        "custom/windowlist" = {
          format = "{}";
          return-type = "json";
          exec = "${list-niri-windows}/bin/list-niri-windows";
        };
      };
    };
  };
}
