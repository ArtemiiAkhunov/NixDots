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

    hydra = final.inputs.lix-hydra.hydra.override (
      args:
      let
        pkgs = args.pkgs.extend (
          _: prev': { perlPackages = prev'.perlPackages.overrideScope (_: p: { URIws = p.URI; }); }
        );
      in
      {
        inherit pkgs;
        inherit (pkgs) perlPackages;
      }
    );

    waybar = prev.waybar.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./waybar-hyprland-lua-dispatch.patch ];
    });
    #nginxStable = prev.nginxStable.override { openssl = prev.pkgs.libressl; };

  };
}
