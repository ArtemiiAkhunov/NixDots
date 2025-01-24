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
  
  programs.zsh.envExtra = ''
    DEVKITPRO=/opt/devkitpro/
    DEVKITARM=/opt/devkitpro/devkitARM/
  '';

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.home-manager.enable = true; # Leave home-manager in the system
}
