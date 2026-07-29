{
  programs.ssh =
    let
      rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in
    {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        theros = {
          HostName = "172.17.57.73";
          User = "voidwalker";
          IdentityFile = rsa_key_path;
        };
        eldraine = {
          HostName = "172.17.57.200";
          User = "voidwalker";
          IdentityFile = rsa_key_path;
        };
        proxmox = {
          HostName = "172.17.57.246";
          User = "root";
          IdentityFile = rsa_key_path;
        };
        ubuntu = {
          HostName = "172.17.57.27";
          User = "voidwalker";
          IdentityFile = rsa_key_path;
        };
        aws = {
          HostName = "172.17.57.201";
          User = "ubuntu";
          IdentityFile = rsa_key_path;
        };
        oracle = {
          HostName = "172.17.57.209";
          User = "ubuntu";
          IdentityFile = "/home/voidwalker/.ssh/oracle";
        };
      };
    };
}
