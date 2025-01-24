{
  pkgs,
  ...
}:
{
  home = {
    username = "voidwalker";
    homeDirectory = "/home/voidwalker";
    stateVersion = "24.11";
  };

  imports = [
    ../common
  ];

  programs.zsh.shellAliases = {
    "home-update" = "home-manager switch --flake ~/Dotfiles/.#voidwalker@zendikar --extra-experimental-features nix-command --extra-experimental-features flakes";
    "ff" = "${pkgs.fastfetch}/bin/fastfetch";
  };
}
