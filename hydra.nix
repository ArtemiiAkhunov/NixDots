{ inputs, outputs }:
let
  inherit (inputs.nixpkgs.lib) filterAttrs mapAttrs elem;

  notBroken = pkg: !(pkg.meta.broken or false);
  isDistributable = pkg: (pkg.meta.license or { redistributable = true; }).redistributable;
  hasPlatform = sys: pkg: elem sys (pkg.meta.platforms or [ ]);
  filterValidPkgs =
    sys: pkgs: filterAttrs (_: pkg: hasPlatform sys pkg && notBroken pkg && isDistributable pkg) pkgs;
  getNixosCfg = _: cfg: cfg.config.system.build.toplevel;
  getHomeCfg = _: cfg: cfg.config.home.activationPackage;
  getStdenv = _: cfg: cfg.stdenv;
in
{
  pkgs = mapAttrs filterValidPkgs outputs.packages;
  hosts = mapAttrs getNixosCfg outputs.nixosConfigurations;
  homes = mapAttrs getHomeCfg outputs.homeConfigurations;
  shells = mapAttrs getStdenv outputs.devShells.x86_64-linux;
}
