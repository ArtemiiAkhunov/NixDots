{
  description = "Void Walker's System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    catppuccin.url = "github:catppuccin/nix";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
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
      formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);
      homeConfigurations = {
        "voidwalker@kamigawa" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [
            ./home-manager/homes/kamigawa.nix
            inputs.catppuccin.homeManagerModules.catppuccin
            inputs.spicetify-nix.homeManagerModules.default
            inputs.rose-pine-hyprcursor.packages.x86_64-linux.default
          ];
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
        "voidwalker@theros" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [ ./home-manager/homes/theros.nix ];
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
      };

      nixosConfigurations = {
        "kamigawa" = lib.nixosSystem {
          modules = [
            (
              { ... }:
              {
                nixpkgs.overlays = builtins.attrValues overlays;
              }
            )
            ./nixos/machines/kamigawa
            inputs.nixvim.nixosModules.nixvim
            inputs.agenix.nixosModules.default
          ];
        };
        "theros" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (
              { ... }:
              {
                nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
              }
            )
            ./nixos/machines/theros
            inputs.nixvim.nixosModules.nixvim
            inputs.agenix.nixosModules.default
            inputs.nix-minecraft.nixosModules.minecraft-servers
          ];
        };
      };
    };
}
