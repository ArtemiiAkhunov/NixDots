{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.voidwalker.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQ1Aic5f7KL+Ieo3E3VZBqqfn4BBIGlQ/ziU7dNdzzJ voidwalker@kaldheim"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgtURguuVAPcLrHOlJysqIoYOR+JR6El8Wt3HKqDVqS voidwalker@kamigawa"
  ];
}
