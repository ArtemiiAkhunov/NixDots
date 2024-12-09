{
  users.users.voidwalker.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
