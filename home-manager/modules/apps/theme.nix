{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
    #systemd.user.sessionVariables = config.home-manager.users.voidwalker.home.sessionVariables;
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };
}
