{ pkgs, config, ... }:
{
  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = [ "wg0" ];
  };

  networking.wireguard.interfaces = {
    wg0 =
      let
        ip = "192.168.0.2";
        subnet = "31";
      in
      {
        ips = [ "${ip}/${subnet}" ];

        listenPort = 51820;

        postUp = ''
          ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s ${ip}/${subnet} -o eth0 -j MASQUERADE
        '';
      
        preDown = ''
          ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s ${ip}/${subnet} -o eth0 -j MASQUERADE

        '';

        privateKeyFile = config.age.secrets.wireguard.path;

        peers = [
          {
            # Laptop
            publicKey = "DCXN3v23bP/heSsl6q+5uSY58Cl8B0iBlkZETDX+KnM=";
            allowedIPs = [ "192.168.0.3/32" ];
          }
        ];
      };
    };
  
    services.dnsmasq = {
      enable = true;
      extraConfig = "interface=wg0";
    };
}
