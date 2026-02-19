{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    nwg-displays
    vlc
    wl-clipboard

    # Stickerprinter Space
    (pkgs.inkscape-with-extensions.override {
      inkscapeExtensions = with pkgs-unstable.inkscape-extensions; [
        silhouette
        inkstitch
      ];
    })
  ];

  imports = [
    ./hyprland/hyprland.nix
    ./niri/niri.nix
    ./common.nix
    ./tmp.nix
    ./programs/gtk.nix
    ./programs/dhbw.nix
    ./programs/vscode.nix
    ./services/udiskie.nix
  ];

  home.username = "anian";
  home.homeDirectory = "/home/anian";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";

  home.shellAliases = {
    nrs = "nh os switch ~/dotfiles --hostname nixos-laptop";
  };
}
