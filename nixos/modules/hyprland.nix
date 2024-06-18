{pkgs, ...}: {
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ]; 
  };

  # Hyprlock stuff
  security.pam.services.hyprlock = {
    enable = true;
  };
}
