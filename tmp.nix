{pkgs, ...}: {
  home.packages = with pkgs; [
    mqtt-explorer
    openconnect
    thunderbird
    fastfetch
    astal.hyprland
    systemctl-tui
    fzf
    fd
    unzip
    ripgrep
  ];
}
