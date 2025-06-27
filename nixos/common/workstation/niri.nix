{ pkgs, ... }:
{
  programs.niri.enable = true;

  xdg.portal = {
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
