{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
    discord
    zapzap
    p3x-onenote
    spotify
    bitwarden-desktop
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
    vlc
    nemo
    onefetch
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
    ./programs/neovim/neovim.nix
    ./programs/bat.nix
    ./programs/tree.nix
    ./programs/rofi.nix
    ./programs/fzf.nix
    ./programs/television.nix
    ./programs/btop.nix
    ./programs/cursor.nix
    ./programs/termstat.nix
    ./programs/nh.nix
  ];

  home.shellAliases = {
    nfu = "nix flake update --flake ~/dotfiles";
    nsp = "nix-shell -p";
    nd = "nix develop -c $SHELL";
    ll = "ls -la --group-directories-first";
    pls = "sudo";
    ".." = "cd ../";
  };
}
