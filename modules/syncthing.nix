{lib, ...}: {
  imports = lib.optional (builtins.pathExists /etc/nixos-secrets/syncthing.nix) /etc/nixos-secrets/syncthing.nix;

  services.syncthing = {
    enable = true;
    user = "anian";
    group = "users";
    dataDir = "/home/anian/.local/state/syncthing";
    guiAddress = "127.0.0.1:8384";

    settings.options = {
      globalAnnounceEnabled = false;
      localAnnounceEnabled = false;
      relaysEnabled = false;
      natEnabled = false;
    };
  };
}
