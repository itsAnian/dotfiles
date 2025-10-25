{
  config,
  pkgs,
  ...
}: {
  # 1. Enable the xone driver
  hardware.xone.enable = true;

  # 2. Blacklist conflicting kernel modules
  # This is the most important step. We must prevent the default
  # 'xpad' and 'mt76x2u' drivers from grabbing the dongle before 'xone' can.
  boot.blacklistedKernelModules = ["xpad" "mt76x2u"];

  # 3. Enable Steam Hardware (for udev rules/permissions)
  # This is still required for permissions, even for non-Steam games.
  hardware.steam-hardware.enable = true;

  # 4. Add your user to the 'input' group
  # Also required for permissions.
  # Replace <your-username> with your actual username.
  users.users.anian.extraGroups = ["wheel" "input"];

  # 5. Load the 'uinput' module (Good practice)
  boot.kernelModules = ["uinput"];
}
