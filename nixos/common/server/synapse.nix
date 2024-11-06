{ config, ... }:
{
  services.matrix-synapse = {
    enable = true;
    dataDir = "/data/matrix-synapse/";

    settings = {
      server_name = "matrix.lordofthelags.net";
    };

  };
}
