{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    fuzzel
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri.overrideAttrs (old: {
      doCheck = false;
    });
    # stylix?

    settings = {
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
      input = {
        focus-follows-mouse.enable = true;
        keyboard.numlock = true;
        mouse.scroll-button-lock = true;
        warp-mouse-to-focus.enable = true;
        touchpad = {
          dwt = false;
          middle-emulation = true;
          natural-scroll = true;
          tap = true;
        };
      };
      # outputs.<name>.backdrop-color
      # outputs.<name>.background-color
      layout = {
        focus-ring.enable = true;
        focus-ring.width = 3;
        # focus-ring.active = gradiant!;
        # focus-ring.urgent = gradiant!;
        # shadow.color = "000000";
        gaps = 10;
      };
      # animations = {
        # slowdown = ;
        # config-notification-open-close.kind = ;
        # exit-confirmation-open-close.enable = ;
        # config-notification-open-close.kind = ;
        # exit-confirmation-open-close.enable
        # horizontal-view-movement.enable
        # horizontal-view-movement.kind
        # overview-open-close.enable
        # overview-open-close.kind
        # screenshot-ui-open.enable
        # screenshot-ui-open.kind
        # window-close.custom-shader
        # window-close.enable
        # window-close.kind
        # window-movement.enable
        # window-movement.kind
        # window-open.custom-shader
        # window-open.enable
        # window-open.kind
        # window-resize.custom-shader
        # window-resize.enable
        # window-resize.kind
        # workspace-switch.enable
        # workspace-switch.kind
      # };

      binds = {
        "Mod+Q".action.spawn = "kitty";
        "Mod+R".action.spawn = "fuzzel";
        "Mod+B".action.spawn = "brave";

        "Mod+left".action.focus-window-down-or-column-left = {};
        "Mod+down".action.focus-window-down = {};
        "Mod+up".action.focus-window-up = {};
        "Mod+right".action.focus-window-down-or-column-right = {};
        "Mod+Shift+left".action.move-column-left = {};
        "Mod+Shift+down".action.move-window-to-workspace-down = {};
        "Mod+Shift+up".action.move-window-to-workspace-up = {};
        "Mod+Shift+right".action.move-column-right = {};

        "Mod+T".action.switch-preset-column-width = {};
        "Mod+C".action.close-window = {};

        "Mod+F".action.maximize-column = {};
        "Mod+Shift+F".action.fullscreen-window = {};

        "Mod+M".action.quit = {};
      };
    };
  };
}
