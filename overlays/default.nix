{ outputs, inputs }:
{

  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (
      _: flake:
      let
        legacyPackages = ((flake.legacyPackages or { }).${final.system} or { });
        packages = ((flake.packages or { }).${final.system} or { });
      in
      if legacyPackages != { } then legacyPackages else packages
    ) inputs;
  };

  additions = final: prev: import ../packages { pkgs = final; } // { };

  modifications = final: prev: {

    nginxStable = prev.nginxStable.override { openssl = prev.pkgs.libressl; };

  };
}
