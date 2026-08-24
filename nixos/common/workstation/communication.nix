{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    vesktop
    element-desktop
    zoom-us
    slack
  ];
}
