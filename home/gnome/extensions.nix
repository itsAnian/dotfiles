{
  pkgs,
  lib,
  config,
  ...
}: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          "blur-my-shell@aunetx"
          "burn-my-windows@schneegans.github.com"
          "clipboard-indicator@tudmotu.com"
          "color-picker@tuberry"
          "dash-to-dock@micxgx.gmail.com"
          "just-perfection-desktop@just-perfection"
          "logomenu@aryan_k"
          "openbar@neuromorph"
          "quick-settings-audio-panel@rayzeq.github.io"
          "simple-timer@majortomvr.github.com"
          "space-bar@luchrioh"
          "kimpanel@kde.org"
          "rounded-window-corners@fxgn"
          "tactile@lundal.io"
        ];
      };
    };
  };
}
