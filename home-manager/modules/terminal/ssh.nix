{
  programs.ssh = {
    enable = true;
    knownHosts = [
      {
        hostNames = [ "theros" "192.168.5.58"];
        publicKeyFile = ./theros.pub;
      }
    ];
  };
}
