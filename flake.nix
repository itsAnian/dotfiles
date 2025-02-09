{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, hyprpanel, ... }:
    let
    system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config = { allowUnfree = true; };
  };

  pkgs-unstable = import nixpkgs-unstable {
    inherit system;
    config = { allowUnfree = true;};
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
		inherit inputs;
	      };
	    }
	];
      };
    };
  };
}
