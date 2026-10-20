{
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "b15644912e14c85d" ];
  };

  # Trying to use mosh instead of ssh for more stability
  programs.mosh = {
    enable = true;
    openFirewall = false;
  };
}
