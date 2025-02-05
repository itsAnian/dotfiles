{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    vesktop
    whatsapp-for-linux
    p3x-onenote
    spotify
    vscode
    kitty
    starship
    bitwarden
    brave
  ];

  programs.brave = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    ];
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

