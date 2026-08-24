{
  pkgs,
  config,
  lib,
  ...
}:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  environment.systemPackages =
    with pkgs.cudaPackages;
    [
      cudatoolkit
      cudnn
    ]
    ++ [
      nvidia-offload
    ];

  environment.variables = {
    OCL_ICD_VENDORS = "/run/opengl-driver/etc/OpenCL/vendors";
    CUDA_PATH = "${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    EXTRA_CCFLAGS = "-I/usr/include";
  };

  nix.settings = {
    substituters = [ "https://cache.nixos-cuda.org" ];
    trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = lib.mkForce true;
    powerManagement = {
      enable = true;
    };
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

}
