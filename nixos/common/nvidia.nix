{ pkgs, config, lib, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" '' 
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
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
    nvidia-offload
    nvidia-off
    nvidia-on
    pkgs.kmod
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = lib.mkForce true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  systemd.services.nvidiaoff = { # Nvidia Turns off on boot
    enable = true;
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${nvidia-off}/bin/nvidia-off";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
