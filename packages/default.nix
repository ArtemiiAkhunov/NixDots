{ pkgs, ... }:
rec {
  #gfn-electron = pkgs.callPackage ./gfn-electron { };
  pwsp = pkgs.callPackage ./pwsp { };
}
