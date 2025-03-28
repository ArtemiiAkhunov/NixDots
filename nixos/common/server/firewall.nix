{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      3494
    ];
    trustedInterfaces = [ "zteb4fawlt" ];
  };
}
