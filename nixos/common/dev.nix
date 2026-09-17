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
    enableZshIntegration = true;
    settings."warn_timeout" = 0;
  };
}
