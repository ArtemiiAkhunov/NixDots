{ pkgs, ... }:
let
  nvidia-off = pkgs.writeShellScriptBin "nvidia-off" ''
    set -e
    if lsof /dev/nvidia* &>/dev/null ; then
      exit 1
    fi
    if [ ! -d /sys/bus/pci/devices/0000:01:00.0 ]; then
      exit 0
    fi

    ${pkgs.kmod}/bin/modprobe -r nvidia_drm
    ${pkgs.kmod}/bin/modprobe -r nvidia_modeset
    ${pkgs.kmod}/bin/modprobe -r nvidia_uvm
    ${pkgs.kmod}/bin/modprobe -r nvidia
    echo 1 | tee /sys/bus/pci/devices/0000:01:00.0/remove
    rm /dev/nvidia*
  '';
  nvidia-on = pkgs.writeShellScriptBin "nvidia-on" ''
    set -e
    echo 1 | tee /sys/bus/pci/rescan
    ${pkgs.kmod}/bin/modprobe nvidia
    ${pkgs.kmod}/bin/modprobe nvidia_drm
  '';
in
{
  environment.systemPackages = [
    nvidia-off
    nvidia-on
    pkgs.kmod
  ];

  systemd.services.nvidiaoff = {
    # Nvidia Turns off on boot
    enable = true;
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 3";
      ExecStart = "${nvidia-off}/bin/nvidia-off";
    };
    before = [
      "graphical.target"
      "display-manager.service"
    ];
    wantedBy = [ "multi-user.target" ];
  };
}
