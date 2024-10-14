{
  pkgs,
  config,
  lib,
  ...
}:
{
  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = [ "wg0" ];
  };

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = lib.mkOverride 98 true;
    "net.ipv4.conf.default.forwarding" = lib.mkOverride 98 true;
  };

  networking.wireguard.interfaces = {
    wg0 =
      let
        genericIp = number: subnet: "192.168.0.${toString number}/${toString subnet}";
      in
      {
        ips = [ (genericIp 2 24) ];

        listenPort = 51820;

        postSetup = ''
          ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s ${(genericIp 2 24)} -o eth0 -j MASQUERADE
        '';

        postShutdown = ''
          ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s ${(genericIp 2 24)} -o eth0 -j MASQUERADE

        '';

        privateKeyFile = config.age.secrets.wireguard.path;

        peers = [
          {
            # Laptop
            publicKey = "DCXN3v23bP/heSsl6q+5uSY58Cl8B0iBlkZETDX+KnM=";
            allowedIPs = [ (genericIp 3 32) ];
          }
        ];
      };
  };

  services.dnsmasq = {
    enable = true;
    extraConfig = "interface=wg0";
  };
}
