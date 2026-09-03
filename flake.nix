{
  description = "Void Walker's System Configuration";

  inputs = {
    # ==================
    #   GENERAL INPUTS
    # ==================
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ==================
    #   LAPTOP INPUTS
    # ==================

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ==================
    #   SERVER INPUTS
    # ==================

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";

    laggy-world.url = "github:lordofthelags/website";
  };

  outputs =
    { self, ... }@inputs:
    let
      inherit (self) inputs outputs;
      lib = inputs.nixpkgs.lib // inputs.home-manager.lib;
      overlays = import ./overlays { inherit inputs outputs; };

      systems = [ "x86_64-linux" ];
      pkgsFor = lib.genAttrs systems (
        system:
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = builtins.attrValues overlays;
        }
      );
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    in
    {
      formatter = forEachSystem (pkgs: pkgs.nixfmt-tree);
      packages = forEachSystem (pkgs: import ./packages { inherit pkgs; });
      hydraJobs = import ./hydra.nix { inherit inputs outputs; };

      homeConfigurations = {
        "voidwalker@kamigawa" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [
            ./home-manager/homes/kamigawa.nix
            inputs.catppuccin.homeModules.catppuccin
            inputs.spicetify-nix.homeManagerModules.default
            inputs.nixvim.homeModules.nixvim
          ];
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
        "voidwalker@theros" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [
            ./home-manager/homes/theros.nix
            inputs.nixvim.homeModules.nixvim
          ];
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
        "voidwalker@kaldheim" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [
            ./home-manager/homes/kaldheim.nix
            inputs.catppuccin.homeModules.catppuccin
            inputs.spicetify-nix.homeManagerModules.default
            inputs.nixvim.homeModules.nixvim
          ];
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
      };

      nixosConfigurations = {
        "kamigawa" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (
              { ... }:
              {
                nixpkgs.overlays = builtins.attrValues overlays;
                environment.systemPackages = [
                  inputs.rose-pine-hyprcursor.packages.x86_64-linux.default
                  inputs.agenix.packages.x86_64-linux.default
                ];
                programs.nix-ld.enable = true;
              }
            )
            ./nixos/machines/kamigawa
            inputs.agenix.nixosModules.default
          ];
        };
        "theros" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (
              { ... }:
              {
                nixpkgs.overlays = builtins.attrValues overlays ++ [ inputs.nix-minecraft.overlay ];
                environment.systemPackages = [ inputs.agenix.packages.x86_64-linux.default ];
              }
            )
            ./nixos/machines/theros
            inputs.agenix.nixosModules.default
            inputs.nix-minecraft.nixosModules.minecraft-servers
          ];
          specialArgs = {
            inherit inputs;
          };
        };
        "kaldheim" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.lanzaboote.nixosModules.lanzaboote
            (
              { lib, ... }:
              {
                nixpkgs.overlays = builtins.attrValues overlays;
                environment.systemPackages = [
                  inputs.rose-pine-hyprcursor.packages.x86_64-linux.default
                  inputs.agenix.packages.x86_64-linux.default
                ];
                boot.loader.systemd-boot.enable = lib.mkForce false;
                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/var/lib/sbctl";
                };
              }
            )
            ./nixos/machines/kaldheim
            inputs.agenix.nixosModules.default
          ];
        };
        /*
          "eldraine" = inputs.nixos-raspberrypi.lib.nixosSystem {
            modules = [
              (
                { config, ... }:
                {
                  nixpkgs.overlays = builtins.attrValues overlays ++ [
                    # nixos-raspberrypi pins nixpkgs 26.05; backport what landed after it
                    (_: _: { inherit (inputs.nixpkgs.legacyPackages.aarch64-linux) herdr; })
                  ];
                  environment.systemPackages = [ inputs.agenix.packages.aarch64-linux.default ];
                  system.nixos.tags =
                    let
                      cfg = config.boot.loader.raspberry-pi;
                    in
                    [
                      "raspberry-pi-${cfg.variant}"
                      cfg.bootloader
                      config.boot.kernelPackages.kernel.version
                    ];
                }
              )
              ./nixos/machines/eldraine
              inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
              inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k
              inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4
              inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
              inputs.agenix.nixosModules.default
            ];
            specialArgs = {
              inherit inputs;
            };
          };
        */
      };
    };
}
