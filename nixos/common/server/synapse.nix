{config, ...}:
{
  networking.firewall = { # Firewall
    allowedTCPPorts = [
      8448
    ];
  };

  services.postgresql = { # Database
    enable = true;
    dataDir = "/data/postgresql/";
  };

  services.matrix-synapse = { # Synapse
    enable = true;
    dataDir = "/data/matrix-synapse/";
    server_name = "lordofthelags.net";
    public_baseurl = "matrix.lordofthelags.net";
    enable_registration = true;
    enable_registration_captcha = true;

    tls_certificate_path = "/var/lib/acme/matrix.lordofthelags.net/fullchain.pem";
    tls_private_key_path = "/var/lib/acme/matrix.lordofthelags.net/key.pem";

    database_type = "psycopg2";
    database_args = {
      database = "matrix-synapse";
    };

    listeners = [
      { # federation
        bind_address = "";
        port = 8448;
        resources = [
          { compress = true; names = [ "client" "webclient" ]; }
          { compress = false; names = [ "federation" ]; }
        ];
        tls = true;
        type = "http";
        x_forwarded = false;
      }
      { # client
        bind_address = "127.0.0.1";
        port = 8008;
        resources = [
          { compress = true; names = [ "client" "webclient" ]; }
        ];
        tls = false;
        type = "http";
        x_forwarded = true;
      }
    ];

    extraConfig = ''
      max_upload_size: "100M"
    '';
    extraConfigFiles = [
      config.age.secrets.synapse_secrets.path
    ];
  };
}
