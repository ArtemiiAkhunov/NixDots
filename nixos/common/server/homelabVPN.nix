{pkgs, config, ...}: {
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };
  networking.nat.internalInterfaces = [ "wg1" ];
  networking.firewall = {
    allowedUDPPorts = [ 51845 ];
  };

  networking.wg-quick.interfaces = {
    wg1 = {
      address = [ "10.123.57.1/24" ];
      listenPort = 51845;
      postUp = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i %i -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -A FORWARD -o %i -j ACCEPT;
        ${pkgs.iptables}/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
        '';
      postDown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i %i -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -D FORWARD -o %i -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
        '';

      privateKeyFile = config.age.secrets.hl_wireguard_private.path;

      peers = [
        {
          publicKey = "aM+cgdZZQi6otSNBIhS7+uze61yZ+SxwpPgsoHlpeiU=";
          allowedIPs = "10.123.57.2/32";
          persistentKeepalive = 30;
        }
      ];
    };
  }; 
}
