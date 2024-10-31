{config, ...}:
{
  services.matrix-synapse = {
    enable = true;
    dataDir = "/data/matrix-synapse/";

    settings = {
      server_name = "matrix.lordofthelags.net";
      tls_certificate_path = config.age.secrets.tls_cert.path;
      tls_private_key_path = config.age.secrets.tls_private.path;
    };


  };
}
