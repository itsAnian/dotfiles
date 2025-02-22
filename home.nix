{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    vesktop
      zapzap
      p3x-onenote
      spotify
      vscode
      bitwarden
      gimp
      superfile
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

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship/starship.toml;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userEmail = "anian.seidl@gmail.com";
    userName = "itsAnian";
    extraConfig = {
      push.autoSetupRemote = true;
      core.editor = "vim";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
	package = pkgs.adwaita-icon-theme;
	name = "Adwaita";
    };
  };


  imports = [
    ./kitty/kitty.nix
      ./nixvim/nixvim.nix
      ./rofi.nix
      ./hyprland/hyprland.nix
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
  };

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  programs.home-manager.enable = true;
#manual.manpages.enable = false;
  programs.bash.enable = true;

  home.stateVersion = "24.11";
			       }
