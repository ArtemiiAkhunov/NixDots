{ pkgs, lib, ... }:
{
  systemd.user.services.pwsp-daemon = {
    Unit = {
      Description = "Pipewire Soundpad Daemon";
      Requires = [ "pipewire.service" ];
      After = [ "pipewire.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = lib.getExe' pkgs.pwsp "pwsp-daemon";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
