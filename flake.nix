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

  outputs = {nixpkgs, home-manager, spicetify-nix, ...}@inputs:
    let 
      system = "x86_64-linux";
    in {
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
        ];
      };
  };
}
