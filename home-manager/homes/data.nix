{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home = {
    username = "aakhunov";
    homeDirectory = "/homes/aakhunov";
    stateVersion = "24.11";
  };

  imports = [
    ../common
    ../common/terminal
    ../common/static/fetch.nix
    ../common/apps/lf.nix
  ];

  programs.zsh.shellAliases = {
    "home-update" = "nh home switch ~/Dotfiles --configuration aakhunov@data";
    "ff" = "${pkgs.fastfetch}/bin/fastfetch";
  };
  programs.gpg.enable = false;
  programs.git.signing.signByDefault = false;
}
