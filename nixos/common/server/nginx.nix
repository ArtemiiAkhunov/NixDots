{ config, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "artemii13052003@gmail.com";
      dnsProvider = "porkbun";
      environmentFile = config.age.secrets.porkbun_api.path;
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        acmeRoot = null;
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
        acmeRoot = null;
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
