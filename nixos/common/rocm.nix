{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.rocmPackages; [
    clr # HIP runtime (libamdhip64) + hipconfig
    rocminfo
    rocm-smi
  ];

  # ROCm consumers (PyTorch, ollama, Blender's HIP backend) look for a
  # /opt/rocm that does not exist on NixOS. Point it at clr.
  systemd.tmpfiles.rules = [ "L+ /opt/rocm - - - - ${pkgs.rocmPackages.clr}" ];
}
