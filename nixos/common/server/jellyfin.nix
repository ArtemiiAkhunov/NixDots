{ ... }:
let
  jellyfinRoot = "/data/jellyfin";
in
{
  services.jellyfin = {
    enable = true;
    configDir = "${jellyfinRoot}/config";
    cacheDir = "${jellyfinRoot}/cache";
    dataDir = "${jellyfinRoot}/data";
    openFirewall = true;
  };

  boot.supportedFilesystems = [ "nfs" ];
  
  fileSystems."${jellyfinRoot}/movies" = {
    device = "192.168.42.6:/mnt/pool/root/jellyfin";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
}
