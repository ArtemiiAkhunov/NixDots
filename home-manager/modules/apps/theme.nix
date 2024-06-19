{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
      size="standard";
      tweaks = [ "normal" ];
    };
    #systemd.user.sessionVariables = config.home-manager.users.voidwalker.home.sessionVariables;
  };

  qt = {
    enable = true;
    platformTheme.name = "catppuccin";
    style = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
    };
  };
}
