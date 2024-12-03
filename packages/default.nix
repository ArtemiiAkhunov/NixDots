{ pkgs, ... }:
rec {
  cura-appimage = pkgs.callPackage ./cura-appimage { };
}
