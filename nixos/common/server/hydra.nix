{ config, pkgs, ... }:
{
  services.hydra = {
    enable = true;
    hydraURL = "https://hydra.lordofthelags.net";
    port = 4200;
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
    buildMachinesFiles = [ ];
    minimumDiskFree = 5;
    extraConfig = ''
      binary_cache_secret_key_file=${config.age.secrets.hydra_secret.path}
    '';
  };

  nix.settings.allowed-uris = [
    "github:"
    "git+https://github.com/"
    "git+ssh://github.com/"
  ];

  # Lets localhost execute aarch64 binaries (for eldraine), and registers
  # aarch64-linux in nix.settings.extra-platforms.
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  nix.buildMachines = [
    {
      hostName = "localhost";
      system = "x86_64-linux";
      supportedFeatures = [
        "kvm"
        "nixos-test"
        "big-parallel"
        "benchmark"
      ];
      maxJobs = 2;
    }
    {
      # Emulated, so no kvm/nixos-test.
      hostName = "localhost";
      system = "aarch64-linux";
      supportedFeatures = [
        "big-parallel"
        "benchmark"
      ];
      maxJobs = 1;
    }
  ];

  nix.settings.max-jobs = 2;
}
