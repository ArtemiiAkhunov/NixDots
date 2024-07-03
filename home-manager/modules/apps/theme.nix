{pkgs, ...}: {
  catppuccin = {
    flavor = "mocha";
    enable = true;
    accent="lavender";
  };

  #YES, NO ACCENTS HERE, PLEZ
  programs.zsh.syntaxHighlighting.catppuccin.enable = false;
  catppuccin.pointerCursor.enable = false;

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
