# Copy this file to /etc/nixos-secrets/syncthing.nix (as root) and fill in
# the real values. It lives entirely outside this git repo — no gitignore
# tricks, no staging, git never sees it. Must be identical on both
# nixos-laptop and nixos-pc.
#
#   sudo mkdir -p /etc/nixos-secrets
#   sudoedit /etc/nixos-secrets/syncthing.nix
#
# Get a device ID on each machine with:
#   syncthing device-id --config /home/anian/.local/state/syncthing/.config/syncthing --data /home/anian/.local/state/syncthing/.config/syncthing
# Get the Tailscale IP on each machine with:
#   tailscale ip -4
{...}: {
  services.syncthing.settings = {
    devices = {
      nixos-laptop = {
        id = "<LAPTOP-DEVICE-ID>";
        addresses = ["tcp://<laptop-tailscale-ip>:22000"];
      };
      nixos-pc = {
        id = "<PC-DEVICE-ID>";
        addresses = ["tcp://<pc-tailscale-ip>:22000"];
      };
    };

    folders."~/Pictures" = {
      id = "pictures";
      label = "Pictures";
      devices = ["nixos-laptop" "nixos-pc"];
      type = "sendreceive";
    };
  };
}
