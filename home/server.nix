{pkgs, ...}: {
  home.packages = with pkgs; [
    vim
  ];

  imports = [
    ./programs/git.nix
    ./programs/nh.nix
  ];

  home.username = "server";
  home.homeDirectory = "/home/server";

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";

  home.shellAliases = {
    nrs = "nh os switch ~/dotfiles --hostname nixos-server";
  };

  programs.bash.enable = true;
}
