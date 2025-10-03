{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    todo-shell = {
      url = "github:itsanian/todo-shell";
    };

    edu-sync-nix = {
      url = "github:Marc55s/edu-sync-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };

    openconnect-sso = {
      url = "github:jcszymansk/openconnect-sso";
      inputs.nixpkgs.follows = "nixpkgs-openconnect-sso";
    };
    nixpkgs-openconnect-sso.url = "github:nixos/nixpkgs/46397778ef1f73414b03ed553a3368f0e7e33c2f";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    todo-shell,
    edu-sync-nix,
    grub2-themes,
    openconnect-sso,
    niri,
    ...
  }: let
    system = "x86_64-linux";

    overlay = final: prev: {
      edu-sync-cli = inputs.edu-sync-nix.packages.${system}.default;
      openconnect-sso = inputs.openconnect-sso.packages.${pkgs.system}.openconnect-sso;
      todo-shell = inputs.todo-shell.defaultPackage.${pkgs.system};
    };

    pkgs = import nixpkgs {
      inherit system;
      overlays = [overlay];
      config = {allowUnfree = true;};
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {allowUnfree = true;};
    };

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos-laptop = lib.nixosSystem {
        modules = [
          grub2-themes.nixosModules.default
          ./hosts/laptop/configuration.nix
          ./hosts/laptop/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anian = import ./home/laptop.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs pkgs-unstable;
              host = "nixos-laptop";
            };
          }
        ];
      };

      nixos-pc = lib.nixosSystem {
        modules = [
          grub2-themes.nixosModules.default
          ./hosts/pc/configuration.nix
          ./hosts/pc/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anian = import ./home/pc.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs pkgs-unstable;
              host = "nixos-pc";
            };
          }
        ];
      };
    };
  };
}
