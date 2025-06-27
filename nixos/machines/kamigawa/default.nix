{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./nvidia-offload.nix
    ../../common
    ../../common/intel-gpu.nix
    ../../common/nvidia.nix
    ../../common/nvidia-off.nix
    ../../common/workstation
    ../../common/geoclue.nix
  ];
}
