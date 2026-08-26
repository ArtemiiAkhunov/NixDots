{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ../../common
    ../../common/amd-gpu.nix
    ../../common/rocm.nix
    ../../common/workstation
  ];
}
