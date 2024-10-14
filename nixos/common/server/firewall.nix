{
  networking.firewall ={
    allowadTCPPorts = [
      22
      53
      80
      443
    ];
    allowedUDPPorts = [
      53
      51820
    ];
  };
}
