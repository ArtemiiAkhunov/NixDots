{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      1701
    ];
    allowedUDPPorts = [ 51820 ];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8010;
      }
      {
        from = 50000;
        to = 60000;
      }
    ];
    checkReversePath = "loose";
  };
}
