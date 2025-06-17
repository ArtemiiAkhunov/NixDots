{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      2283
      3494
    ];
    trustedInterfaces = [ "zteb4fawlt" ];
  };
}
