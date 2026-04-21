{ pkgs, ... }:
{
  programs.niri.enable = true;

  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = "gtk";
    };
  };

  # Lock session on lid close so swayidle's "lock" event fires
  services.logind.lidSwitch = "lock";
}
