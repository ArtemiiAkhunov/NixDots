{
  programs.ssh =
    let
      rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in
    {
      enable = true;
      matchBlocks = {
        theros = {
          hostname = "172.17.57.73";
          user = "voidwalker";
          identityFile = rsa_key_path;
        };
        eldraine = {
          hostname = "172.17.57.200";
          user = "voidwalker";
          identityFile = rsa_key_path;
        };
        proxmox = {
          hostname = "172.17.57.246";
          user = "root";
          identityFile = rsa_key_path;
        };
        ubuntu = {
          hostname = "172.17.57.27";
          user = "voidwalker";
          identityFile = rsa_key_path;
        };
        aws = {
          hostname = "172.17.57.101";
          user = "ubuntu";
          identityFile = rsa_key_path;
        };
        oracle = {
          hostname = "172.17.57.209";
          user = "ubuntu";
          identityFile = "/home/voidwalker/.ssh/oracle";
        };
      };
    };
}
