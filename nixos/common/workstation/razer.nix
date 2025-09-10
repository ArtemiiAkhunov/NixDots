{ pkgs, ... }:
{
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
  users.users.voidwalker = { extraGroups = [ "openrazer" ]; };
}
