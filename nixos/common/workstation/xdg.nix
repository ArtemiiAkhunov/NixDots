{ pkgs, ... }:
{
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
  };
}
