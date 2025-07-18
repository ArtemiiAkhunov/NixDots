{ config, ... }:
{
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server.port = 5667;
      /*
        theme = {

        };
      */
      pages = [
        {
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "dns-stats";
                  service = "pihole-v6";
                  allow-insecure = true;
                  url = "http://127.0.0.1:2345";
                  password = {
                    _secret = "${config.age.secrets.pihole.path}";
                  };
                }
                {
                  type = "repository";
                  repository = "ArtemiiAkhunov/NixDots";
                  pull-requests-limit = 5;
                  issues-limit = 3;
                  commits-limit = 3;
                }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "search";
                  autofocus = true;
                  search-engine = "duckduckgo";
                  new-tab = true;
                  bangs = [
                    {
                      title = "YouTube";
                      shortcut = "!yt";
                      url = "https://www.youtube.com/results?search_query={QUERY}";
                    }
                    {
                      title = "Github";
                      shortcut = "!gh";
                      url = "https://github.com/search?q={QUERY}&type=repositories";
                    }
                  ];
                }
                {
                  type = "monitor";
                  cache = "1m";
                  title = "Services";
                  sites = [
                    {
                      title = "Jellyfin";
                      url = "https://jellyfin.lordofthelags.net";
                      check-url = "http://192.168.42.2:8096";
                      icon = "di:jellyfin";
                    }
                    {
                      title = "Immich";
                      url = "https://immich.lordofthelags.net";
                      check-url = "http://192.168.42.2:2283";
                      icon = "di:immich";
                    }
                    {
                      title = "Pi-Hole";
                      url = "https://pihole.lordofthelags.net/admin";
                      check-url = "http://192.168.42.2:2283/admin";
                      icon = "di:pi-hole";
                    }
                    {
                      title = "VaultWarden";
                      url = "https://vw.lordofthelags.net";
                      check-url = "https://vw.lordofthelags.net";
                      icon = "di:vaultwarden";
                    }
                    {
                      title = "NextCloud";
                      url = "https://nextcloud.lordofthelags.net";
                      check-url = "https://nextcloud.lordofthelags.net";
                      icon = "di:nextcloud";
                    }
                    {
                      title = "Portainer";
                      url = "https://portainer.lordofthelags.net";
                      check-url = "http://192.168.42.2:9000";
                      icon = "di:portainer";
                    }
                    {
                      title = "Hydra";
                      url = "https://hydra.lordofthelags.net";
                      check-url = "http://192.168.42.2:4200";
                      icon = "di:nixos";
                    }
                  ];
                }
              ];
            }
          ];
          name = "Home";
        }
      ];
    };
  };
}
