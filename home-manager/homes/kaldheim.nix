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
    stateVersion = "25.05";
  };

  imports = [
    ../common
    ../common/wm
    ../common/terminal
    ../common/static
    ../common/apps
  ];

  # Specific Configuration for a machine

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname kaldheim";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@kaldheim";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };
}
