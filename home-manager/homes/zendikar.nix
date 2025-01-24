{
  pkgs,
  ...
}:
{
  home = {
    username = "voidwalker";
    homeDirectory = "/homes/voidwalker";
    stateVersion = "24.11";
  };

  imports = [
    ../common
  ];

  programs.zsh.shellAliases = {
    "home-update" = "nh home switch ~/Dotfiles --configuration voidwalker@theros";
    "ff" = "${pkgs.fastfetch}/bin/fastfetch";
  };
}
