{ pkgs, config, ... }:
{
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = [ "wg0" ];

  networking.wireguard.interfaces = {
    wg0 =
    let
      ip = "192.168.5.201";
      subnet = "22";
    in
    {
      ips = [ "${ip}/${subnet}" ];

      listenPort = 51820;

      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s ${ip}/${subnet} -o eth0 -j MASQUERADE
      '';

      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s ${ip}/${subnet} -o eth0 -j MASQUERADE
      '';

      privateKeyFile = config.age.secrets.wireguard-server.path;

      peers = [
        { # Laptop
          publicKey = "H71T90I6YQdQH7Z3yFFztn9os3md9WfcGz7YTceQ1nI=";
          allowedIPs = [ "${ip}/32" ]; 
        }
      ];
    };
  };
}
