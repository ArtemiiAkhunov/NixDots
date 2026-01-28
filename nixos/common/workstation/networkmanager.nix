{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "stable-ssid";
    plugins = [
      pkgs.networkmanager-openconnect
    ];
  };
}
