{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.voidwalker.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA220xmCC5RCUXRjTuEV87z4wPDsbn8IXtbMpaUwiWr9 voidwalker@kaldheim"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZnYBYqrL2oHZwASlFxmGZBGyS06QrO79jdnJbVwaDn voidwalker@kamigawa"
  ];
}
