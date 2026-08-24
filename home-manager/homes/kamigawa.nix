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
    ../common/terminal
    ../common/static
    ../common/apps
  ];

  # Specific Configuration for a machine

  # Baseline: reproduces the sizes exactly as they were authored. Lower this if
  # this panel also wants a smaller interface.
  ui.scale = 1.0;

  # Left unset, so Firefox stays unmanaged here and keeps its own default of
  # -1.0 ("follow the display") rather than being pinned to a fixed factor.
  ui.browserScale = null;

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname kamigawa";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@kamigawa";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };
}
