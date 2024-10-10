{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    name = "Capitaine Cursors";
    size = 32;
    package = pkgs.capitaine-cursors;
  };
}
