{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      3494
      15917
    ];
    trustedInterfaces = [ "zteb4fawlt" ];
  };
}
