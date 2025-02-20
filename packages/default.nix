{ pkgs, ... }:
rec {
  creality-print-appimage = pkgs.callPackage ./creality-print { };
}
