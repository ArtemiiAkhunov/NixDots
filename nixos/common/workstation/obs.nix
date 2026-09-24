{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  environment.systemPackages = with pkgs; [
    obs-studio
  ];
}
