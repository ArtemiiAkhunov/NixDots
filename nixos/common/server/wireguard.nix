{ pkgs, config, ... }:
{
  networking.wg-quick.interfaces = {
    wg0 = {
      ips = [ "192.168.77.2/32" ];
      listenPort = 51820;
      table = "123";

      preUp = "${pkgs.iproute2}/bin/ip rule add from 192.168.77.2 table 123 priority 456";
      postDown = "${pkgs.iproute2}/bin/ip rule del from 192.168.77.2 table 123 priority 456";

      privateKeyFile = config.age.secrets.wireguard_private.path;

      peers = [
        {
          publicKey = "/bOE9Q2xr1e/GH//SmXzM6P20PAfSmsirenpWsU3giQ=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "129.158.49.4:51820";
          persistentKeepalive = 30;
        }
      ];

    };
  };
}
