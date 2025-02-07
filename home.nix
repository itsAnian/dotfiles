{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    vesktop #discord
    whatsapp-for-linux #whatsapp
    p3x-onenote #onenote
    spotify #spotify
    vscode #visual studio code
    bitwarden #bitwarden
  ];

  programs.brave = { #brave browser
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    ];
  };

  programs.zsh = { #better terminal commands
    enable = true;
    enableCompletion = true;
  };

  programs.starship = { #terminal addon for git
    enable = true;
    settings = pkgs.lib.importTOML ./starship/starship.toml;
    enableZshIntegration = true;
  };

  programs.git = { #git
    enable = true;
    userEmail = "anian.seidl@gmail.com";
    userName = "itsAnian";
    extraConfig = {
      push.autoSetupRemote = true;
    };
  };

  imports = [
      ./kitty/kitty.nix #installs and configures kitty
      ./nixvim.nix #installs and configures nixvim/nvim
  ];

  services.sxhkd = { #adds hotkeys
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

  home.shellAliases = { #sets shortcuts
        nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gl = "git log --oneline";
        gd = "git diff";
        ll = "ls -la";
        ".." = "cd ../";
    };

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  programs.home-manager.enable = true;
  #manual.manpages.enable = false;
  programs.bash.enable = true;

  home.stateVersion = "24.05";
}

