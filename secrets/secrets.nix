let
  voidwalker_laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZnYBYqrL2oHZwASlFxmGZBGyS06QrO79jdnJbVwaDn voidwalker@kamigawa";
  voidwalker_server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA00U4xIt6ecQc30bi8+FeNnWVqSFe0fk5Sq6vdQLNE/ voidwalker@theros";
  users = [ voidwalker_laptop voidwalker_server ];

  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH/eCnK3VWmM4mWvwv2zI/VY5uOSMWpMDVSz1v75DfTo root@theros";
  systems = [ server ];
in
  {
    "something.age".publicKeys = users;
  }
