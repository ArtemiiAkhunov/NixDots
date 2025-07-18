{config, ...}: {
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server.port = 5667;
      /*theme = {
        
      };*/
      pages = [
        {
          columns =[
            {
              size = "small";
              widgets = [
                {
                  type = "dns-stats";
                  service = "pihole";
                  url = "http://127.0.0.1:2345";
                  token = {
                    _secret = "${config.age.secrets.pihole.path}";
                  };
                }
              ];
            }
            {
              size="full";
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
                      alt-status-codes = [
                        401
                        403
                      ];
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
                      check-url = "http://192.168.42.2:2345";
                      icon = "di:pi-hole";
                    }
                    {
                      title = "VaultWarden";
                      url = "https://vw.lordofthelags.net/admin";
                      check-url = "http://192.168.42.2:12345";
                      icon = "di:vaultwarden";
                    }
                    {
                      title = "NextCloud";
                      url = "https://nextcloud.lordofthelags.net/admin";
                      check-url = "http://192.168.42.7:8080";
                      icon = "di:nextcloud";
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
