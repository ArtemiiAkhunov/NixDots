{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnumake
    gcc
    vscode-extensions.ms-vscode.cpptools
    gdb
    rustc
    rustup
    cargo
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global."warn_timeout" = 0;
  };
}
