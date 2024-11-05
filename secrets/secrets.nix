let
  voidwalker_laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZnYBYqrL2oHZwASlFxmGZBGyS06QrO79jdnJbVwaDn voidwalker@kamigawa";
  voidwalker_server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA00U4xIt6ecQc30bi8+FeNnWVqSFe0fk5Sq6vdQLNE/ voidwalker@theros";
  users = [
    voidwalker_server
    voidwalker_laptop
  ];
in
{
  "tls_cert.age".publicKeys = users;
  "tls_private.age".publicKeys = users;
  "wireguard_private.age".publicKeys = users;
}
