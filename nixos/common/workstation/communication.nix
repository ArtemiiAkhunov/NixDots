{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunderbird
    telegram-desktop
    vesktop
    element-desktop
    zoom-us
    slack
  ];
}
