{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
  ];

  imports = [
    ./common.nix
    ./tmp.nix
    ./programs/dhbw.nix
    ./programs/3d-print.nix
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

  home.stateVersion = "25.05";
}
