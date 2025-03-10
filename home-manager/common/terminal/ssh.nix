{
  programs.ssh =
    let
      rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in
    {
      enable = true;
      matchBlocks = {
        theros = {
          hostname = "172.17.57.245";
          user = "voidwalker";
          identityFile = rsa_key_path;
        };

        zendikar = {
          hostname = "172.17.57.162";
          user = "voidwalker";
          identityFile = rsa_key_path;
          setEnv = {
            "TERM" = "xterm";
          };
        };
        oracle = {
          hostname = "172.17.57.209";
          user = "ubuntu";
          identityFile = "/home/voidwalker/.ssh/oracle";
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
