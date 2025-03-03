{ config, ... }: {
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
  ];

  nix.settings.max-jobs = 2;
}
