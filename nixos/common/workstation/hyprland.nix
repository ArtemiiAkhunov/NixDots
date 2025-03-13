{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  xdg.portal = {
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.hyprland = {
      "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
    };
  };

  # Hyprlock stuff
  security = {
    pam.services.hyprlock.text = ''
      # PAM configuration file for the swaylock screen locker. By default, it includes
      # the 'login' configuration file (see /etc/pam.d/login) 
      auth sufficient pam_unix.so likeauth try_first_pass # password
      auth sufficient ${pkgs.fprintd}/lib/security/pam_fprintd.so max-tries=2 # frpint
      auth required pam_deny.so # deny
    '';
  };
}
