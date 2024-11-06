{ config, lib, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "artemii13052003@gmail.com";
    certs."lordofthelags.net" = {
      domain="*.lordofthelags.net";
      environmentFile = config.age.secrets.porkbun_api.path;
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/lordofthelags.net";
        locations."/.well-known/matrix/client" = {
          return = ''
            200 '{"m.homeserver": {"base_url": "https://matrix.lordofthelags.net"}}'
          '';
          extraConfig = ''
            default_type application/json;
            add_header Access-Control-Allow-Origin *;
          '';
        };
      };
      "matrix.lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        locations."~ ^(/_matrix|/_synapse/client)" = {
          proxyPass = "http://localhost:8008";
          extraConfig = ''
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Host $host;
            client_max_body_size 50M;
          '';
        };
      };
    };
  };
}
