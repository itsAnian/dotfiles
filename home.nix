{ config, pkgs, inputs, ... }: {
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
    ./rofi.nix #installs and configures "launcher"
    ./hyprland/hyprland.nix #installs and configures wayland
    ./hyprland/hyprpanel.nix 
  ];

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

  home.stateVersion = "24.11";
}
