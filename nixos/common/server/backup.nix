{
  fileSystems."/backups" = {
    device = "192.168.42.6:/mnt/pool/root/backups/borg";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}
