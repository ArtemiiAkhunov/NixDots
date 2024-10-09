{
  description = "Void Walker's System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, ... }:
    let 
      inherit (self) inputs outputs;
      lib = inputs.nixpkgs.lib // inputs.home-manager.lib
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
    in {
      flakeDir = "~/Dotfiles/";
      homeConfigurations = {
        "voidwalker@kamigawa" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [
            ./home-manager/homes/kamigawa.nix
            inputs.catppuccin.homeManagerModules.catppuccin
            inputs.spicetify-nix.homeManagerModules.default
          ];
          extraSpecialArgs = {
            inherit inputs outputs
          };
        };
        "voidwalker@theros" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [
            ./home-manager/homes/theros.nix
          ];
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
      };


      nixosConfigurations = {
        "kamigawa" = lib.nixosSystem {
          modules = [
            (
              { config, pkgs, ...}: {
                nixpkgs.overlays = builtins.attrValues overlays;
              }
            )
            ./nixos/common/
            ./nixos/common/nvidia.nix
            ./nixos/common/intel-gpu.nix
            ./nixos/machines/kamigawa/
          ];
        };
        "theros" = lib.nixosSystem {
          modules = [
            ./nixos/common/
            ./nixos/common/intel-gpu.nix
            ./nixos/machines/theros/
          ];
        };
      };

      /*
      nixosConfigurations.kamigawa = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system;
        };
	      modules = [ 
          inputs.nixvim.nixosModules.nixvim
          ./nixos/configuration.nix
        ];
        inherit system;
      };

      homeConfigurations.voidwalker = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit spicetify-nix;
        };
        modules = [ 
          ./home-manager/home.nix 
          inputs.catppuccin.homeManagerModules.catppuccin
          spicetify-nix.homeManagerModules.default
        ];*/
      };
  };
}
