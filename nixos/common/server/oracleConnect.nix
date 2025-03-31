{ pkgs, config, ... }:
{

  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "192.168.77.2/32" ];
      listenPort = 51820;
      table = "123";

      preUp = "${pkgs.iproute2}/bin/ip rule add from 192.168.77.2 table 123 priority 456";
      postDown = "${pkgs.iproute2}/bin/ip rule del from 192.168.77.2 table 123 priority 456";

      privateKeyFile = config.age.secrets.oracle_wireguard_private.path;

      peers = [
        {
          publicKey = "F9RYOj6P3ppMweTvxrn9sxN1XRaBXxX9z/C9BKoYUQI=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "141.148.94.174:51820";
          persistentKeepalive = 30;
        }
      ];

    };
  };
}
