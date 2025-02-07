{ pkgs, ... }:
{
  environment.variables = {
    OCL_ICD_VENDORS = "/run/opengl-driver/etc/OpenCL/vendors";
    EXTRA_CCFLAGS = "-I/usr/include";
  };
}
