{ pkgs, config, ... }:
{
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/data/jellyfin/smb" = {
    device = "//192.168.42.6/dataset/mediaLibrary";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=${config.age.secrets.smb_credentials.path}" ];
  };
}
