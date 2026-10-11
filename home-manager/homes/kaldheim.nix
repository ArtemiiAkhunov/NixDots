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

  # 2880x1920 panel at Hyprland scale 2 is 1440x960 logical. The shared
  # modules are authored for a much larger screen, so pull the interface in.
  ui.scale = 0.7;

  # Lock screen text and logo end up too small at 0.7.
  ui.lockScale = 1.5;

  # Firefox follows the display's 2x scale on its own.
  ui.browserScale = null;

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname kaldheim";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@kaldheim";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };

  wayland.windowManager.hyprland.extraConfig = ''
    hl.monitor({
      output = "eDP-1",
      mode = "2880x1920@120.00",
      position = "auto",
      scale = 2.0,
    })
  '';
}
