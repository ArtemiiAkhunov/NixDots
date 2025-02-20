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
      "portainer.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9000";
          proxyWebsockets = true;
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
      "vw.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:12345";
          proxyWebsockets = true;
        };
      };
      "ollama.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://192.168.0.6:3000";
          proxyWebsockets = true;
        };
      };
    };
  };
}
