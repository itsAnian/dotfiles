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
    systemd.enable = true;
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
          format = "%a %b %d  %H:%M";
          icon = "󰸗";
        };
        menus = {
          dashboard = {
            powermenu = {
              avatar.image = "~/dotfiles/hyprland/panda.jpeg";
              avatar.name = "itsAnian";
            };
            shortcuts.enabled = false;
          };
        };
      };
    };
  };
}
