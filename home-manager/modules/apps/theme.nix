{pkgs, ...}: {
  catppuccin = {
    flavor = "mocha";
    enable = true;
    accent="lavender";
  };
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };
  };
}
