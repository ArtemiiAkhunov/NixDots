{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.voidwalker.openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy1FoVEo5BdrPfFDoacv6gW23k3TCiHxlDNrjJ/x9kU voidwalker@kamigawa"];
}
