{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
      size = 36;
    };
    theme = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
    };
    #systemd.user.sessionVariables = config.home-manager.users.voidwalker.home.sessionVariables;
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
    };
  };
}
