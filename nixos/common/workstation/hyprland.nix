{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Hyprlock stuff
  security = {
    polkit = {
      enable = true;
    };
    pam.services.hyprlock.text = "auth include system-auth";
  };
}
