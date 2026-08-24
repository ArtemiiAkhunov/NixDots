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

    # Reject martian ZeroTier-sourced packets fast; a silent drop stalls
    # WebRTC ICE gathering ~40s and breaks Vesktop voice.
    extraCommands = ''
      iptables -I OUTPUT -s 172.17.57.0/24 ! -o zt+ -j REJECT --reject-with icmp-net-unreachable
    '';
    extraStopCommands = ''
      iptables -D OUTPUT -s 172.17.57.0/24 ! -o zt+ -j REJECT --reject-with icmp-net-unreachable || true
    '';
  };
}
