{pkgs, ...}: {
  home.packages = with pkgs; [
    nwg-displays
    vlc
    wl-clipboard
  ];

  imports = [
    ./desktop-environments/hyprland/hyprland.nix
    ./desktop-environments/niri/niri.nix
    ./common.nix
    ./tmp.nix
    ./programs/gtk.nix
    ./programs/dhbw.nix
    ./programs/vscode.nix
    ./programs/inkscape.nix
    ./services/udiskie.nix
  ];

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";

  home.shellAliases = {
    nrs = "nh os switch ~/dotfiles";
  };
}
