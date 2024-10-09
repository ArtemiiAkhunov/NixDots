{config, pkgs, lib, inputs, ...}: {
  home = {
    username = "voidwalker";
    homeDirectory = "/home/voidwalker";
    stateVersion = "24.05";
  };

  imports = [
    ../common
    ../common/shell/
  ];

  

}
