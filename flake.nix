{
  description = "NixOS dotfiles of itsAnian";

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
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
      hytale-launcher = inputs.hytale-launcher.packages.${system}.default;
      spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
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

    pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
      src = ./.;
      hooks = {
        deadnix.enable = true;
        # deadnix.settings.edit = true;
        # alejandra.enable = true;
      };
    };

    mkHost = {
      hostname,
      username,
      useGrub,
    }:
      lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs pkgs-unstable;
        };

        modules =
          [
            {nixpkgs.pkgs = pkgs;}

            ./hosts/${hostname}/configuration.nix
            ./hosts/${hostname}/hardware-configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home/${hostname}.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs-unstable;
                host = hostname;
              };
            }
          ]
          ++ lib.optional useGrub grub2-themes.nixosModules.default;
      };
  in {
    checks.${system}.pre-commit-check = pre-commit-check;

    devShells.${system}.default = pkgs.mkShell {
      inherit (pre-commit-check) shellHook;
      buildInputs = pre-commit-check.enabledPackages;
    };

    nixosConfigurations = {
      nixos-laptop = mkHost {
        hostname = "laptop";
        username = "anian";
        useGrub = true;
      };

      nixos-pc = mkHost {
        hostname = "pc";
        username = "anian";
        useGrub = true;
      };

      nixos-server = mkHost {
        hostname = "server";
        username = "server";
        useGrub = false;
      };
    };
  };
}
