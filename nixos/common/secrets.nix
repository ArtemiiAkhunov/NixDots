{
  age = {
    identityPaths = [ "/home/voidwalker/.ssh/id_ed25519" "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.something = {
      file = ../../secrets/something.age;
      path = "/etc/something.txt";
    };
  };
}
