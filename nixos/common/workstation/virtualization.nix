{ pkgs, ... }:
{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables; # kernel has no legacy ip_tables module
  };
  users.users.voidwalker.extraGroups = [ "libvirtd" ];
}
