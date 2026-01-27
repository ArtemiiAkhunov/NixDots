{ ... }:
{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  users.users.voidwalker.extraGroups = [ "libvirtd" ];
}
