{pkgs, ...}: {
  home.packages = with pkgs; [
    vim
    lazydocker
    btop
    systemctl-tui
    unzip
    fastfetch
  ];

  imports = [
    ./programs/git.nix
    ./programs/nh.nix
    ./programs/fzf.nix
    ./programs/bat.nix
  ];

  home.username = "server";
  home.homeDirectory = "/home/server";

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";

  home.shellAliases = {
    nrs = "nh os switch ~/dotfiles --hostname nixos-server";
  };

  programs.bash.enable = true;
}
