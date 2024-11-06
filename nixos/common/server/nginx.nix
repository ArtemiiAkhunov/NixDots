{ config, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "artemii13052003@gmail.com";
    certs."lordofthelags.net" = {
      dnsProvider = "porkbun";
      environmentFile = config.age.secrets.porkbun_api.path;
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "matrix.lordofthelags.net" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:8448";
        };
      };
    };
  };
}
