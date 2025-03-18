{ ... }:
let
  jellyfinRoot = "/data/jellyfin";
in
{
  services.jellyfin = {
    enable = true;
    configDir = "${jellyfinRoot}/config";
    cacheDir = "${jellyfinRoot}/cache";
    dataDir = "${jellyfinRoot}/data";
    openFirewall = true;
  };
}
