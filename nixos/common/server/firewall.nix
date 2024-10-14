{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
    ];
    allowedUDPPorts = [ 51820 ];
  };

}
