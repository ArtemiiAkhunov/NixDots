let
  voidwalker_kamigawa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgtURguuVAPcLrHOlJysqIoYOR+JR6El8Wt3HKqDVqS voidwalker@kamigawa";
  voidwalker_theros = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGu2Ti/hBRJOKfu2WnWWBbHbt70vz+QbeNHobcCySWCM voidwalker@theros";
  voidwalker_kaldheim = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQ1Aic5f7KL+Ieo3E3VZBqqfn4BBIGlQ/ziU7dNdzzJ voidwalker@kaldheim";
  users = [
    voidwalker_theros
    voidwalker_kamigawa
    voidwalker_kaldheim
  ];
in
{
  "oracle_wireguard_private.age".publicKeys = users;
  "porkbun_api.age".publicKeys = users;
  "nut_admin_password.age".publicKeys = users;
  "nut_observer_password.age".publicKeys = users;
  "hydra_secret.age".publicKeys = users;
}
