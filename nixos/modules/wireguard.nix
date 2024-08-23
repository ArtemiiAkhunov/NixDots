{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ " 10.2.0.2/32" ];
      dns = [ "10.2.0.1" ];
      privateKeyFile = "/home/voidwalker/.vpn/ProtonVPN_private.key";

      peers = [
        {
          publicKey = "XsJ968M1eNOuehhnuFTAtlTpzQfyFLpYTzo3L6Xe8EA=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "89.187.179.55:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
