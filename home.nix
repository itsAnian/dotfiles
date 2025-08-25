{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    vesktop
    zapzap
    p3x-onenote
    spotify
    vscode
    bitwarden
    gimp
    superfile
    neovim
    lua-language-server
    nwg-displays
    remnote
    vlc
    inputs.todo-shell.defaultPackage.x86_64-linux
    edu-sync-cli
    pkgs-unstable.obsidian
    signal-desktop
    nil
    alejandra
    nerd-fonts.jetbrains-mono
    wl-clipboard
    ferdium
    bat
    tree
  ];

  programs.brave = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb"
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  programs.git = {
    enable = true;
    userEmail = "anian.seidl@gmail.com";
    userName = "itsAnian";
    delta = {
      enable = true;
      options = {
        features = "decorations";
      };
    };
    extraConfig = {
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd z"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  imports = [
    ./kitty.nix
    ./hyprland/hyprland.nix
    ./starship.nix
    ./presenterm.nix
    ./tmp.nix
  ];

  home.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#";
    nsp = "nix-shell -p";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gl = "git log --oneline";
    gd = "git diff";
    gp = "git push";
    "gpfusch" = "git push -f";
    ll = "ls -la";
    ".." = "cd ../";
    vi = "nvim";
    vim = "nvim";
    cd = "z";
    weather = "curl wttr.in";
    cat = "bat";
  };

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  programs.home-manager.enable = true;
  #manual.manpages.enable = false;
  programs.bash.enable = true;

  home.stateVersion = "25.05";
}
