let
  voidwalker_laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZnYBYqrL2oHZwASlFxmGZBGyS06QrO79jdnJbVwaDn voidwalker@kamigawa";
  voidwalker_server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA00U4xIt6ecQc30bi8+FeNnWVqSFe0fk5Sq6vdQLNE/ voidwalker@theros";
in
{
  "wireguard-server.age".publicKeys = [ voidwalker_server ];
  "wireguard-laptop.age".publicKeys = [ voidwalker_laptop ];
}
