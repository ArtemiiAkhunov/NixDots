{ config, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "artemii13052003@gmail.com";
      dnsProvider = "porkbun";
      environmentFile = config.age.secrets.porkbun_api.path;
    };
    certs."matrix.lordofthelags.net" = {
      group = "matrix-synapse";
      allowKeysForGroup = true;
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
      "minecraft.lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        acmeRoot = null;
        locations."/".extraConfig = ''
          return 404;
        '';
      };
      "matrix.lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        acmeRoot = null;
        locations."/".proxyPass = "http://127.0.0.1:8008";
      };
    };
  };
}
