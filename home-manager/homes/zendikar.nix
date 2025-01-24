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
    "python" = "python3";
  };
  
  programs.zsh.envExtra = ''
    export DEVKITPRO=/opt/devkitpro/
    export DEVKITARM=/opt/devkitpro/devkitARM/
  '';

  home.packages = with pkgs; [
    ripgrep
    fzf
    tpm2-tss
  ];

  programs.home-manager.enable = true; # Leave home-manager in the system
}
