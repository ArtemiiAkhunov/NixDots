{
  hardware.amdgpu = {
    initrd.enable = true; # amdgpu in the initrd, so KMS is up before the display manager
    opencl.enable = true; # rocmPackages.clr.icd, the OpenCL runtime
  };

  # Enable OpenGL. Mesa carries radeonsi (GL), RADV (Vulkan) and the VA-API /
  # VDPAU decoders for this hardware, so nothing extra is needed here.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
