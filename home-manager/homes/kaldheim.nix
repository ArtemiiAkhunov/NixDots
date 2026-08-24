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

  # 1600x900 eDP panel driven at scale 1 (~107 DPI). The shared modules are
  # authored for a much larger screen, so pull the whole interface in.
  ui.scale = 0.7;

  # Gentler than ui.scale: this scales page content as well as chrome.
  ui.browserScale = 0.9;

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname kaldheim";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@kaldheim";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };
}
