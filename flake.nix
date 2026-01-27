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

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    lix-hydra = {
      url = "https://git.lix.systems/lix-project/hydra/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ==================
    #   LAPTOP INPUTS
    # ==================

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    # Temp fix for copyq
    nixpkgs-copyq.url = "github:NixOS/nixpkgs/5f8f0b633274f3f20ef8e72672f02d55667ea24f";

    # ==================
    #   SERVER INPUTS
    # ==================

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

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
      };

      nixosConfigurations = {
        "kamigawa" = lib.nixosSystem {
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
        };
      };
    };
}
