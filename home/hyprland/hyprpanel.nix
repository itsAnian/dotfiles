{
  ...
}: let
  theme = builtins.fromJSON (builtins.readFile ./everforest_vivid.json);
in {
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme =
        theme
        // {
          bar.floating = true;
        };
      bar = {
        windowtitle.title_map = [
          ["kitty" "" "Terminal"]
          ["brave" "" "Brave"]
          ["vesktop" "󰙯" "Discord"]
        ];
        layouts = {
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
              "battery"
              "bluetooth"
              "network"
              "clock"
              "notifications"
            ];
          };
        };
        launcher.autoDetectIcon = true;
        clock = {
          format = "%a %d %b - %H:%M";
          icon = "󰸗";
        };
        bluetooth = {
          label = false;
        };
        network = {
          label = false;
          showWifiInfo = true;
        };
        battery = {
          hideLabelWhenFull = true;
        };
        notifications = {
          show_total = true;
          hideCountWhenZero = true;
        };
      };

      menus = {
        clock = {
          weather.enabled = false;
          time.military = true;
        };
        dashboard = {
          directories.enabled = false;
          powermenu = {
            avatar.image = "~/dotfiles/home/hyprland/images/panda.jpeg";
            avatar.name = "itsAnian";
          };
          shortcuts.enabled = false;
        };
      };
    };
  };
}
