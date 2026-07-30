{ ... }: {
  imports = [
    ./shell
    ./nixvim
    ./terminal/ssh.nix
    ./terminal/herdr.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
