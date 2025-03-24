{ pkgs, ... }:
{
  catppuccin = {
    flavor = "mocha";
    enable = true;
    accent = "lavender";
    #YES, NO ACCENTS HERE, PLEZ
    zsh-syntax-highlighting.enable = false;
    cursors.enable = false;
    swaync.enable = false;
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

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
}
