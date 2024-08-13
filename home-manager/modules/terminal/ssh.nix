{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      theros = {
        hostname = "192.168.5.58";
        user = "voidwalker";
        identityFile = "/home/voidwalker/.ssh/id_rsa";
        port = 2222;
      };
      data = {
        hostname = "data.cs.purdue.edu";
        user = "aakhunov";
        identityFile = "/home/voidwalker/.ssh/id_ed25519";
      };
    };
  };
}
