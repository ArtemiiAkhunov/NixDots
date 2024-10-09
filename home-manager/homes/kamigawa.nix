{config, pkgs, lib, inputs, ...}: {
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
  ];

  programs.zsh.shellAliases = {
    "rebuild" = "nh os switch ~/Dotfiles/.#kamigawa";
    "home-update" = "nh home switch ~/Dotfiles/.#voidwalker@kamigawa";
    "ff" = "fastfetch";
    "ssh" = "kitten ssh";
  };
  programs.zsh.initExtra = ''
    fastfetch
    '';


}
