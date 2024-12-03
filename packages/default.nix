{ pkgs, ... }:
rec {
  creality-print = pkgs.callPackage ./creality-print { };
}
