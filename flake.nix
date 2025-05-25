{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    todo-shell = {
      url = "github:itsanian/todo-shell";
    };

    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    hyprpanel,
    todo-shell,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {allowUnfree = true;};
    };

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              inputs.hyprpanel.overlay
            ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anian = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs-unstable;
            };
          }
        ];
      };
    };
  };
}
