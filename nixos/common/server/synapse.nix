{ config, ... }:
{
  networking.firewall = {
    # Firewall
    allowedTCPPorts = [
      8448
    ];
  };

  services.postgresql = {
    # Database
    enable = true;
    dataDir = "/data/postgresql/";
  };

  services.matrix-synapse = {
    # Synapse
    enable = true;
    dataDir = "/data/matrix-synapse/";

    settings = {
      server_name = "lordofthelags.net";
      public_baseurl = "matrix.lordofthelags.net";

      database = {
        type = "psycopg2";
        args = {
          database = "matrix-synapse";
        };
      };

      max_upload_size = "100M";

      enable_registration = true;
      enable_registration_captcha = true;

      tls_certificate_path = "/var/lib/acme/matrix.lordofthelags.net/fullchain.pem";
      tls_private_key_path = "/var/lib/acme/matrix.lordofthelags.net/key.pem";

      listeners = [
        {
          # client
          bind_addresses = [
            "127.0.0.1"
          ];
          port = 8008;
          resources = [
            {
              compress = false;
              names = [
                "client"
                "federation"
              ];
            }
          ];
          tls = false;
          type = "http";
          x_forwarded = true;
        }
      ];
    };

    extraConfigFiles = [
      config.age.secrets.synapse_secrets.path
    ];
  };
}
