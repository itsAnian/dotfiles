{
  nixpkgs.config.allowUnfree = true;
  # flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
