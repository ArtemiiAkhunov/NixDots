{pkgs, ...}: 
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
      user = "voidwalker";
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOut = "tty";
    StandardError = "journal";
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYHangup = true;
    TTYVTDisallocate = true;
  };
}
