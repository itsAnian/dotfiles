{
  config,
  pkgs,
  ...
}: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];

  environment.systemPackages = with pkgs; [
    gnome-tweaks

    gnome-extension-manager
    gnome-calendar
    gnome-screenshot
    gnome-calculator
    gnome-console
    gdm-settings
    nautilus
    evince # documentviewer
    eog # image viewer

    #Extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.open-bar
    gnomeExtensions.burn-my-windows
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.color-picker
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.logo-menu
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.simple-timer
    gnomeExtensions.space-bar
    gnomeExtensions.kimpanel
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.tactile
  ];
}
