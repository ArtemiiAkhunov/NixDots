{
  age = {
    identityPaths = [
      "/home/voidwalker/.ssh/id_ed25519"
      "/etc/ssh/ssh_host_ed25519_key"
    ];
    secrets = {
      wireguard-server.file = ../../secrets/wireguard-server.age;
      wireguard-laptop.file = ../../secrets/wireguard-laptop.age;
    };
  };
}
