{
  programs.ssh = let 
    rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in {
    enable = true;
    matchBlocks = {
      theros = {
        hostname = "192.168.5.58";
        user = "voidwalker";
        identityFile = rsa_key_path;
      };
      data = {
        hostname = "data.cs.purdue.edu";
        user = "aakhunov";
        identityFile = rsa_key_path;
      };
      xinu = {
        hostname = "xinu13.cs.purdue.edu";
        user = "aakhunov";
        identityFile = rsa_key_path;
      };
    };
  };
}
