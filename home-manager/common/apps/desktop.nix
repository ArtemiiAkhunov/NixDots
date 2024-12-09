{ pkgs, ... }:
let
  cura-icon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Ultimaker/Cura/main/packaging/icons/cura-icon.svg";
    sha256 = "sha256-ypqrZ/Wv/a+oyYHYtP8Aa/BeOBelTBoLcDEauiViJ7I=";
  };
in
{
  xdg.desktopEntries = {
    cura = {
      name = "Cura";
      genericName = "3D Printing Software";
      exec = "cura-appimage %U";
      icon = cura-icon;
      terminal = false;
      categories = [ "Utility" ];
    };
  };
}
