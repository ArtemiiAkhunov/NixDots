{ pkgs, ... }:
rec {
  cura-appimage = pkgs.callPackage ./cura-appimage { };
  creality-print-appimage = pkgs.callPackage ./creality-print { };
}
