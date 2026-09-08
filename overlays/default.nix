{ outputs, inputs }:
{

  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (
      _: flake:
      let
        legacyPackages = ((flake.legacyPackages or { }).${final.stdenv.hostPlatform.system} or { });
        packages = ((flake.packages or { }).${final.stdenv.hostPlatform.system} or { });
      in
      if legacyPackages != { } then legacyPackages else packages
    ) inputs;
  };

  additions = final: prev: import ../packages { pkgs = final; } // { };

  modifications = final: prev: {

    waybar = prev.waybar.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./waybar-hyprland-lua-dispatch.patch ];
    });
    #nginxStable = prev.nginxStable.override { openssl = prev.pkgs.libressl; };

  };
}
