{ pkgs, ... }:
{
  hardware.amdgpu = {
    initrd.enable = true; # amdgpu in the initrd, so KMS is up before the display manager
    opencl.enable = true; # rocmPackages.clr.icd, the OpenCL runtime
  };

  # linux-firmware; newer cards (e.g. RDNA4) need PSP/DMCUB blobs from here
  # for display output to come up at all, not just for acceleration.
  hardware.enableRedistributableFirmware = true;

  # Enable OpenGL. Mesa carries radeonsi (GL), RADV (Vulkan) and the VA-API /
  # VDPAU decoders for this hardware, so nothing extra is needed here.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  environment.systemPackages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];

}
