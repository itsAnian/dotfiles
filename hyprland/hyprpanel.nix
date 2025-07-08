{
  config,
  pkgs,
  inputs,
  ...
}: let
  theme = builtins.fromJSON (builtins.readFile ./everforest_vivid.json);
in {
  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    settings = {
      theme = theme;
      bar = {
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
              "bluetooth"
              "battery"
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
      };

      menus = {
        clock = {
          weather.enabled = false;
          time.military = true;
        };
        dashboard = {
          directories.enabled = false;
          powermenu = {
            avatar.image = "~/dotfiles/hyprland/panda.jpeg";
            avatar.name = "itsAnian";
          };
          shortcuts.enabled = false;
        };
      };
    };
  };
}
