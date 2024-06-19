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

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {nixpkgs, home-manager, ...}@inputs:
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
        modules = [ 
          ./home-manager/home.nix 
          inputs.catppuccin.homeManagerModules.catppuccin
        ];
      };
  };
}
