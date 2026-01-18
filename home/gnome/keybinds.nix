{
  pkgs,
  lib,
  config,
  ...
}: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Super>c"];
        toggle-maximized = ["<Super>f"];
        toggle-fullscreen = ["<Shift><Super>f"];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        # ... your existing dash-to-dock settings ...
        hot-keys = false;
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/brave/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/brave-incognito/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty" = {
        binding = "<Super>q";
        command = "${pkgs.kitty}/bin/kitty";
        name = "Kitty Terminal";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/brave" = {
        binding = "<Super>b";
        command = "${pkgs.brave}/bin/brave";
        name = "Brave Browser";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/brave-incognito" = {
        binding = "<Shift><Super>b";
        command = "${pkgs.brave}/bin/brave --incognito";
        name = "Brave Incognito";
      };
    };
  };
}
