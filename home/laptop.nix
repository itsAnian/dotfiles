{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    nwg-displays
    vlc
    wl-clipboard

    python3
  ];

  imports = [
    ./hyprland/hyprland.nix
    ./common.nix
    ./tmp.nix
    ./programs/gtk.nix
    ./programs/dhbw.nix
  ];

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
