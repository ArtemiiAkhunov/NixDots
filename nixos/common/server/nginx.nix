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
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    virtualHosts = {
      "lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        acmeRoot = null;
        locations = {
          "/.well-known/matrix/client" = {
            return = ''200 '{"m.homeserver": {"base_url": "https://matrix.lordofthelags.net"}}' '';
            extraConfig = ''
              default_type application/json;
              add_header Access-Control-Allow-Origin *;
            '';
          };
          "/.well-known/matrix/server" = {
            return = ''200 '{"server": {"m.server": "matrix.lordofthelags.net:433"}}' '';
            extraConfig = ''
              default_type application/json;
              add_header Access-Control-Allow-Origin *;
            '';
          };
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
        locations = {
          "/".extraConfig = ''
            return 404;
          '';
          "/_matrix".proxyPass = "http://127.0.0.1:8008";
        };

      };
    };
  };
}
