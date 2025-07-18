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
    clientMaxBodySize = "10G";
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
      "immich.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://[::1]:2283";
          proxyWebsockets = true;
          extraConfig = ''
            client_max_body_size 50000M;
            proxy_read_timeout   600s;
            proxy_send_timeout   600s;
            send_timeout         600s;
          '';
        };
      };
      "minecraft.lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
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
      "nextcloud.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://192.168.42.7:8080";
          proxyWebsockets = true;
        };
      };
      "jellyfin.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8096";
          proxyWebsockets = true;
        };
      };
      "hydra.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:4200";
          proxyWebsockets = true;
        };
      };
      "pihole.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:2345";
          proxyWebsockets = true;
        };
      };
      "start.lordofthelags.net" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:5667";
          proxyWebsockets = true;
        };
      };
    };
  };
}
