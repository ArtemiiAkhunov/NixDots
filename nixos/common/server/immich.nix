{ ... }:
{
  fileSystems."/data/immich/photos" = {
    device = "192.168.42.6:/mnt/pool/root/immich";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
    ];
  };

}
