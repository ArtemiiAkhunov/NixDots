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
  ui.scale = 1.0;

  ui.browserScale = null;

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles --hostname kamigawa";
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@kamigawa";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };

  wayland.windowManager.hyprland.extraConfig = ''
    hl.monitor({
      output = "desc:Acer Technologies XV272U W2 F54901D808123",
      mode = "2560x1440@240.00",
      position = "0x0",
      scale = 1.0,
      bitdepth = 10,
    })

    hl.monitor({
      output = "desc:Dell Inc. DELL S2725QS HPMXT84",
      mode = "3840x2160@120.00",
      position = "2560x0",
      scale = 1.5,
    })
  '';
}
