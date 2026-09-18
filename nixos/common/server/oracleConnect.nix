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

      # Priority 456 covers TCP: accept() binds the connection's local address
      # to 192.168.77.2, so replies naturally match "from 192.168.77.2".
      # Priority 457 covers UDP services (e.g. Simple Voice Chat) that reply
      # from a wildcard-bound socket, which never gets a fixed source address
      # to match a "from" rule on — route by source port instead.
      preUp = ''
        ${pkgs.iproute2}/bin/ip rule add from 192.168.77.2 table 123 priority 456
        ${pkgs.iproute2}/bin/ip rule add ipproto udp sport 24454 table 123 priority 457
      '';
      postDown = ''
        ${pkgs.iproute2}/bin/ip rule del from 192.168.77.2 table 123 priority 456
        ${pkgs.iproute2}/bin/ip rule del ipproto udp sport 24454 table 123 priority 457
      '';

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
