{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./extensions.nix
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        font-name = "RobotoMono Nerd Font 11";
        monospace-font-name = "RobotoMono Nerd Font 11";
      };

      "org/gnome/desktop/input-sources" = {
        show-all-sources = true;
        sources = [(lib.hm.gvariant.mkTuple ["xkb" "de"]) (lib.hm.gvariant.mkTuple ["xkb" "us"])];
      };

      "org/gnome/shell/extensions/tactile" = {
        # Define the activation key (Default is Super+T)
        show-tiles = ["<Super>t"];

        # Border color/width for the grid overlay
        border-color = lib.hm.gvariant.mkTuple [0.6 0.4 0.0 1.0]; # Gold color
        border-width = 2;

        # Gap size between tiles
        gap-size = 4;
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
        num-workspaces = 4;
        workspace-names = ["一" "二" "三" "四"];
        titlebar-font = "RobotoMono Nerd Font Bold 11";
      };

      "org/gnome/shell/extensions/rounded-window-corners" = {
        skip-libadwaita-app = false;
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = false;
      };

      "org/gnome/shell/extensions/Logo-menu" = {
        menu-button-icon-image = 23;
      };

      "org/gnome/shell/extensions/burn-my-windows" = {
        active-profile = "${config.home.homeDirectory}/.config/burn-my-windows/profiles/default-nix.conf";
      };

      "org/gnome/shell/extensions/tiling-assistant" = {
        enable-tiling-popup = true;
        window-gap = 4;
        single-screen-gap = 0;
        # active-window-hint = 1; # Uncomment if you want the colored border
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        background-opacity = 0.80000000000000004;
        dash-max-icon-size = 38;
        disable-overview-on-startup = true;
        dock-fixed = false;
        dock-position = "BOTTOM";
        height-fraction = 0.90000000000000002;
        intellihide = false;
        intellihide-mode = "ALL_WINDOWS";
        running-indicator-style = "DOTS";
        show-favorites = true;
        show-mounts = false;
        show-mounts-only-mounted = false;
        show-trash = false;
        show-windows-preview = true;
      };
    };
  };

  home.file = {
    ".config/burn-my-windows/profiles/default-nix.conf".text = ''
      [burn-my-windows-profile]
      fire-enable-effect=false
      tv-glitch-enable-effect=false
      tv-enable-effect=true
      apparition-enable-effect=false
      aura-glow-enable-effect=false
      broken-glass-enable-effect=false
      doom-enable-effect=false
      energize-a-enable-effect=false
      energize-b-enable-effect=false
      focus-enable-effect=false
      glide-enable-effect=false
      glitch-enable-effect=false
      hexagon-enable-effect=false
      incinerate-enable-effect=false
      matrix-enable-effect=false
      mushroom-enable-effect=false
      paint-brush-enable-effect=false
      pixelate-enable-effect=false
      pixel-wheel-enable-effect=false
      pixel-wipe-enable-effect=false
      portal-enable-effect=false
      rgbwarp-enable-effect=false
      snap-enable-effect=false
      team-rocket-enable-effect=false
      trex-enable-effect=false
      wisps-enable-effect=false
    '';
  };
}
