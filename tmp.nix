{pkgs, ...}: {
  home.packages = with pkgs; [
    mqtt-explorer
    thunderbird
    fastfetch
    astal.hyprland
    systemctl-tui
    fzf
    fd
    unzip
    ripgrep
    redisinsight
    gparted
    gowall
  ];
}
