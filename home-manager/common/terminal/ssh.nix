{
  programs.ssh =
    let
      rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in
    {
      enable = true;
      matchBlocks = {
        theros = {
          hostname = "172.17.57.249";
          user = "voidwalker";
          identityFile = rsa_key_path;
        };
        data = {
          hostname = "data.cs.purdue.edu";
          user = "aakhunov";
          identityFile = rsa_key_path;
        };
        xinu = {
          hostname = "xinu20.cs.purdue.edu";
          user = "aakhunov";
          identityFile = rsa_key_path;
        };
      };
    };
}
