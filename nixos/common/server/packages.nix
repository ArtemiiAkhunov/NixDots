{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nftables
  ];
}
