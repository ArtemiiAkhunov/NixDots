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

  modifications = final: prev: {
    libfprint = prev.libfprint.overrideAttrs (old: {
      src = builtins.fetchGit {
        url = "https://gitlab.freedesktop.org/libfprint/libfprint";
        ref = "refs/heads/master";
        rev = "e57bab2f1ef3583158d2e6e2b5bb4182629ebe35";
      };
    });

    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (old: {
      version = "10.0.1";
      src = final.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "refs/tags/v0.10.1";
        hash = "sha256-OsHIacgorYnB/dPbzl1b6rYUzQdhTtsJYLsFLJxregk=";
      };
    });

    fprintd = prev.fprintd.overrideAttrs (old: {
      mesonCheckFlags = [
        # PAM related checks are timing out
        "--no-suite"
        "fprintd:TestPamFprintd"
        # Tests FPrintdManagerPreStartTests.test_manager_get_no_default_device & FPrintdManagerPreStartTests.test_manager_get_no_devices are failing
        "--no-suite"
        "fprintd:FPrintdManagerPreStartTests"
      ];
    });
  };
}
