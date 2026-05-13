{lib, ...}: {
  imports = [
    ./shell
    ./nixvim
    ./terminal/ssh.nix
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "cmp-emoji"
  ];
}
