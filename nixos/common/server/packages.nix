{ pkgs, config, ... }:
let
  upsShutdown = (import ./scripts/upsShutdown.nix { inherit pkgs config; });
  customPackages = [
    upsShutdown
  ];
in 
{
  environment.systemPackages = with pkgs; [
    nftables
  ] ++ customPackages;
}
