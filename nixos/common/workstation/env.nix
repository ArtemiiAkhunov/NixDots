{ pkgs, ... }:
{
  environment.variables = {
    OCL_ICD_VENDORS = "/run/opengl-driver/etc/OpenCL/vendors";
    CUDA_PATH="${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    EXTRA_CCFLAGS = "-I/usr/include";
  };
}
