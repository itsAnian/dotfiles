{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    vesktop
    whatsapp-for-linux
    p3x-onenote
    spotify
    vscode
    starship
    bitwarden
    brave
    sxhkd
  ];

  programs.brave = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    ];
  };

  imports = [
      ./kitty/kitty.nix
  ];

  services.sxhkd = {
    enable = true;
    keybindings = {
      "control + alt + t" = "kitty";  # Kitty
      "super + b" = "brave";       # Brave
    };
  };
  /*
  Not native autostart: type this command to add it

  echo '[Desktop Entry]
  Type=Application
  Exec=sxhkd
  Hidden=false
  NoDisplay=false
  X-GNOME-Autostart-enabled=true
  Name=sxhkd
  Comment=Hotkey Daemon' > ~/.config/autostart/sxhkd.desktop
  */

  home.shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#";
        gs = "git status";
        ll = "ls -la";
        ".." = "cd ../";
    };

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  programs.home-manager.enable = true;
  #manual.manpages.enable = false;
  programs.bash.enable = true;

  home.stateVersion = "24.05";

  programs.git = {
    enable = true;
    userEmail = "anian.seidl@gmail.com";
    userName = "itsAnian";
    extraConfig = {
      push.autoSetupRemote = true;
    };
  };
}

