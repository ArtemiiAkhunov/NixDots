{ lib, ... }:
{
  services.displayManager = {
    autoLogin.enable = lib.mkForce false;
  };
  services.xserver.desktopManager.gnome.enable = true;
}
