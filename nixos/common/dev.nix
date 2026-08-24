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
}
