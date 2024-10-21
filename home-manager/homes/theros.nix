{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home = {
    username = "voidwalker";
    homeDirectory = "/home/voidwalker";
  };

  imports = [ ../common ];

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname theros";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@theros";
  };
}
