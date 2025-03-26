{
  programs.ssh =
    let
      rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in
    {
      enable = true;
      matchBlocks = {
        gitlab = {
          hostname = "gitlab.lordofthelags.net";
          user = "git";
          identityFile = rsa_key_path;
          port=15917;
        };
        theros = {
          hostname = "172.17.57.245";
          user = "voidwalker";
          identityFile = rsa_key_path;
        };
        proxmox = {
          hostname = "172.17.57.246";
          user = "root";
          identityFile = rsa_key_path;
        };
        ubuntu = {
          hostname = "172.17.57.213";
          user = "voidwalker";
          identityFile = rsa_key_path;
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
