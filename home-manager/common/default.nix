{ ... }: {
  imports = [
    ./shell
    ./nixvim
    ./terminal/ssh.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
