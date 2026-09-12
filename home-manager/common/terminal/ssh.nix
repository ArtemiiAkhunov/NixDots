{ lib, ... }:
{
  programs.ssh =
    let
      rsa_key_path = "/home/voidwalker/.ssh/id_ed25519";

      uiuc_hosts = lib.listToAttrs (
        map (
          n:
          let
            nn = lib.fixedWidthNumber 2 n;
          in
          lib.nameValuePair "fa26-cs425-26${nn}.cs.illinois.edu uiuc${nn}" {
            HostName = "fa26-cs425-26${nn}.cs.illinois.edu";
            User = "root";
            IdentityFile = "/home/voidwalker/.ssh/uiuc";
          }
        ) (lib.range 1 10)
      );
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
      }
      // uiuc_hosts;
    };
}
