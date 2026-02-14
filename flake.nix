{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
      url = "github:LuckShiba/niri-flake/includes";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    termstat = {
      url = "github:Marc55s/termstat";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hytale-launcher = {
      url = "github:JPyke3/hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    grub2-themes,
    ...
  }: let
    system = "x86_64-linux";

    overlay = _final: _prev: {
      edu-sync-cli = inputs.edu-sync-nix.packages.${system}.default;
      openconnect-sso = inputs.openconnect-sso.packages.${system}.openconnect-sso;
      todo-shell = inputs.todo-shell.defaultPackage.${system};
      hytale-launcher = inputs.hytale-launcher.packages.${pkgs.system}.default;
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    };

    pkgs = import nixpkgs {
      inherit system;
      overlays = [overlay inputs.termstat.overlays.default];
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
            # home-manager.useGlobalPkgs = true;
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
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anian = import ./home/pc.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs pkgs-unstable;
              host = "nixos-pc";
            };
          }
        ];
      };

      nixos-server = lib.nixosSystem {
        modules = [
          ./hosts/server/configuration.nix
          ./hosts/server/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.server = import ./home/server.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs pkgs-unstable;
              host = "nixos-server";
            };
          }
        ];
      };
    };
  };
}
