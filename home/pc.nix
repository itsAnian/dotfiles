{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
  ];

  imports = [
    ./common.nix
    ./tmp.nix
    ./programs/dhbw.nix
  ];

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  home.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos-pc";
    nfu = "nix flake update --flake ~/dotfiles#nixos-pc";
  };

  home.stateVersion = "25.05";
}
