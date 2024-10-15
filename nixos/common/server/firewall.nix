{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
    ];
    trustedInterfaces = [ "zteb4fawlt" ];
  };
}
