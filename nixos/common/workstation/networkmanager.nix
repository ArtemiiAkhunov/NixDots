{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "stable-ssid";
    plugins = [
      pkgs.networkmanager-openconnect
    ];
  };

  environment.systemPackages = with pkgs; [
    networkmanager-l2tp
    networkmanagerapplet
  ];
}
