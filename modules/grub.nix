{
    
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
}
