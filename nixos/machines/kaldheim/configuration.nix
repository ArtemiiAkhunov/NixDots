{ pkgs, ... }:
{
  time.timeZone = null;

  networking.hostName = "kaldheim";

  environment.systemPackages = with pkgs; [
    firefox
    libreoffice
    evince
    mpv
  ];

  system.stateVersion = "25.05"; # DO NOT TOUCH
}
