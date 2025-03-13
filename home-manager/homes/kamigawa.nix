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
    stateVersion = "24.05";
  };

  imports = [
    ../common
    ../common/wm
    # ../common/wm/niri Solved in flake.nix
    ../common/terminal
    ../common/static
    ../common/apps
  ];

  # Specific Configuration for a machine

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname kamigawa";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@kamigawa";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };

  programs.zsh.initExtra = ''
    fastfetch
  '';
}
