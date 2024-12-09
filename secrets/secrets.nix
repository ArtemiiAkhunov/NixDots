let
  voidwalker_laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZnYBYqrL2oHZwASlFxmGZBGyS06QrO79jdnJbVwaDn voidwalker@kamigawa";
  voidwalker_server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCInIkVTDgRGaBsplan/7yRPLd06yoQ1ARYKHzRCgho voidwalker@theros";
  users = [
    voidwalker_server
    voidwalker_laptop
  ];
in
{
  "wireguard_private.age".publicKeys = users;
  "porkbun_api.age".publicKeys = users;
  "synapse_secrets.age".publicKeys = users;
}
