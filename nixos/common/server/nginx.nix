{ config, lib, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "artemii13052003@gmail.com";
    certs."lordofthelags.net" = {
      domain="*.lordofthelags.net";
      dnsProvider = "porkbun";
      webroot = lib.mkForce null;
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
      };
    };
  };
}
