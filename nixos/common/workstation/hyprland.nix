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
    pam.services.hyprlock.text = ''
      auth		sufficient  	pam_unix.so try_first_pass likeauth nullok
      auth		sufficient  	pam_fprintd.so
    '';
  };
}
