{ pkgs, ... }: {
  programs.niri.enable = true;

  services.upower.enable = true;
  
  xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
  ];
}
