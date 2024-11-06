{ config, ... }:
{
  services.matrix-synapse = {
    enable = true;
    dataDir = "/data/matrix-synapse/";
    settings = {
      public_baseurl = "https://matrix.lordofthelags.net:8448/";
    };
  };
}
