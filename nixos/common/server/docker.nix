{
  users.users.voidwalker.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    enableOnBoot = true;
  };
}
