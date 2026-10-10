{
  config,
  inputs,
  pkgs,
  ...
}:
let
  inherit (pkgs.lixPackageSets.stable) lix nix-eval-jobs;
  # Lix's Hydra fork, built against the system Lix: upstream Hydra's queue runner
  # rejects Lix's daemon protocol.
  lixHydra = pkgs.callPackage "${inputs.lix-hydra}/package.nix" {
    inherit (pkgs.lib) fileset;
    inherit nix-eval-jobs;
    rawSrc = inputs.lix-hydra;
    stdenv = pkgs.clangStdenv;
    # Only feeds lix-hydra's perl-packages.nix. OIDC-Lite 0.10's tests reject a valid
    # RS256 token under current OpenSSL (fails closed), so skip them.
    pkgs = pkgs // {
      perlPackages = pkgs.perlPackages // {
        buildPerlModule =
          args:
          pkgs.perlPackages.buildPerlModule (
            args // pkgs.lib.optionalAttrs (args.pname == "OIDC-Lite") { doCheck = false; }
          );
      };
    };
    # nixpkgs' Lix lacks perl bindings, so build them from the matching Lix source.
    nix = lix // {
      perl-bindings = pkgs.callPackage "${inputs.lix-src}/perl" {
        inherit (pkgs.lib) fileset;
        nix = lix;
      };
    };
  };
in
{
  imports = [ "${inputs.lix-hydra}/nixos-modules/hydra.nix" ];

  services.hydra-dev = {
    enable = true;
    package = lixHydra;
    hydraURL = "https://hydra.lordofthelags.net";
    port = 4200;
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
    minimumDiskFree = 5;
    extraConfig = ''
      binary_cache_secret_key_file=${config.age.secrets.hydra_secret.path}
    '';
  };

  # Serves the binary cache instead of hydra-server; nginx routes cache paths here.
  services.harmonia.cache = {
    enable = true;
    signKeyPaths = [ config.age.secrets.hydra_secret.path ];
    settings.bind = "127.0.0.1:5000";
  };

  # The lix-hydra module sets these via extra-trusted-users, which the Lix daemon
  # ignores; untrusted, the queue runner's builds die with "unexpected end-of-file".
  nix.settings.trusted-users = [
    "hydra"
    "hydra-queue-runner"
    "hydra-www"
  ];

  nix.settings.allowed-uris = [
    "github:"
    "git+https://github.com/"
    "git+ssh://github.com/"
  ];

  # Lets localhost execute aarch64 binaries (for eldraine), and registers
  # aarch64-linux in nix.settings.extra-platforms.
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  nix.settings.max-jobs = 2;
}
