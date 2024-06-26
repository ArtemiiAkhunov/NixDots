{
  home = {
    username = "voidwalker";
    homeDirectory = "/home/voidwalker";
    stateVersion = "24.05";
  };

  imports = [
    ./modules/bundle.nix
  ];

  home-manager.useGlobalPkgs = true;
}
