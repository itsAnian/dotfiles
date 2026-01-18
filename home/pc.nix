{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    rivalcfg
  ];

  imports = [
    ./common.nix
    ./tmp.nix
    ./programs/dhbw.nix
    ./programs/3d-print.nix
    ./programs/hytale.nix
    ./gnome/gnome.nix
  ];

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  home.shellAliases = {
    nrs = "nh os switch ~/dotfiles --hostname nixos-pc";
  };

  home.stateVersion = "25.11";
}
