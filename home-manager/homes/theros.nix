{config, pkgs, lib, inputs, ...}: {
  home = {
    username = "voidwalker";
    homeDirectory = "/home/voidwalker";
    stateVersion = "24.05";
  };

  imports = [
    ../common
  ];

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles/.#theros";
    "home-update" = "nh home switch ~/Dotfiles/.#voidwalker@theros";
  };
}