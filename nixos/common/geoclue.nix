{
  services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://api.positon.xyz/v1/geolocate?key=56aba903-ae67-4f26-919b-15288b44bda9";
    enableWifi = true;
  };
  users.users.geoclue.extraGroups = [ "networkmanager" ];
  services.automatic-timezoned.enable = true;
}
