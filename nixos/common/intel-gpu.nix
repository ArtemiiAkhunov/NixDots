{ pkgs, ... }:
{

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
    ];
  };

  services.xserver.videoDrivers = [ "modesetting" ];

  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
}
