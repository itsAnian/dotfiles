{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
    zapzap
    p3x-onenote
    spotify
    vscode
    bitwarden
    gimp
    remnote
    todo-shell
    signal-desktop
    nerd-fonts.jetbrains-mono
    lazygit
    lazydocker
    lazysql
    systemctl-tui
    fd
    nemo
    thunderbird
    unzip
    gowall
    ripgrep
    fastfetch
    libreoffice
  ];

  imports = [
    ./programs/brave.nix
    ./programs/direnv.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/presenterm.nix
    ./programs/starship.nix
    ./programs/zoxide.nix
    ./programs/zsh.nix
    ./programs/neovim.nix
    ./programs/bat.nix
    ./programs/tree.nix
    ./programs/rofi.nix
    ./programs/fzf.nix
    ./programs/television.nix
    ./programs/btop.nix
  ];

  home.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#";
    nfu = "nix flake update --flake ~/dotfiles#";
    nsp = "nix-shell -p";
    nd = "nix develop";
    ll = "ls -la";
    ".." = "cd ../";
  };
}
