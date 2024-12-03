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

    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (old: {
      version = "10.0.1";
      src = final.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "refs/tags/v0.10.1";
        hash = "sha256-OsHIacgorYnB/dPbzl1b6rYUzQdhTtsJYLsFLJxregk=";
      };
    });

  };
}
