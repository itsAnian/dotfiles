{pkgs, ...}: {
  # Bootloader.
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    devices = ["nodev"];
    efiSupport = true;
    useOSProber = true;
  };
  boot.loader.grub2-theme = {
    enable = true;
    theme = "stylish";
    footer = true;
  };

  boot.kernelParams = ["quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3"];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.plymouth = {
    enable = true;
    theme = "infinite_seal";
    #nix-shell -p adi1090x-plymouth-themes --run "ls /nix/store/*adi1090x-plymouth-themes*/share/plymouth/themes"
    # Black-HUD
    # Cross-HUD
    # Glitch
    # Infinite Seal
    # Pixels
    # Square HUD
    themePackages = [
      (pkgs.adi1090x-plymouth-themes.override {
        selected_themes = ["infinite_seal"];
      })
    ];
  };
}
