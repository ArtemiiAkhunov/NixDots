{ config, pkgs, ... }:
{
  services.hydra = {
    enable = true;
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

  nix.settings.allowed-uris = [
    "github:"
    "git+https://github.com/"
    "git+ssh://github.com/"
  ];

  # Lets localhost execute aarch64 binaries (for eldraine), and registers
  # aarch64-linux in nix.settings.extra-platforms.
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  services.hydra-builder = {
    enable = true;
    queueRunnerAddr = "http://[::1]:${toString config.services.hydra.queueRunner.grpc.port}";
    settings.maxJobs = 2;
  };
  systemd.services.hydra-builder.after = [ "hydra-queue-runner.service" ];

  nix.settings.max-jobs = 2;
}
