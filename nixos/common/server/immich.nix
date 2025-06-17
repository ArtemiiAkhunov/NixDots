{ ... }:
let
  immichRoot = "/data/immich";
in
{
  services.immich = {
    enable = true;
    openFirewall = true;
    port = 2283;
    mediaLocation = "${immichRoot}/photos";
    settings.server.externalDomain = "https://immich.lordofthelags.net";
    machine-learning.enable = false;
  };

  boot.supportedFilesystems = [ "nfs" ];
  
  fileSystems."${immichRoot}/photos" = {
    device = "192.168.42.6:/mnt/pool/root/immich";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
}
