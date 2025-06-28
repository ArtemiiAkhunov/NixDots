{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 50;
        spacing = 3;

        modules-left = [
          "custom/clock"
          "tray"
          "custom/weather"
        ];

        modules-center = [ "niri/workspaces" ];

        modules-right = [
          "custom/microphone"
          "wireplumber"
          "network"
          "backlight"
          "niri/language"
          "battery"
          "custom/nc"
        ];

        "tray" = {
          icon-size = 24;
          spacing = 10;
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
          };
        };

        "clock" = {
          format = "{:%H:%M %m/%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
          tooltip = false;
        };

        "custom/clock" = {
          # TZ data messes with waybar's clock module
          format = "{}";
          tooltip = false;
          exec = "date +'%H:%M %m/%d'";
          interval = 60;
        };

        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery" = {
          battery = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "network" = {
          format-wifi = "{essid} ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "wireplumber" = {
          format = "  {volume}%";
          format-muted = "󰝟";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        "niri/language" = {
          format = "{short}";
        };

        "custom/weather" = {
          format = "{}°";
          tooltip = true;
          interval = 3600;
          exec = "${pkgs.wttrbar}/bin/wttrbar";
          return-type = "json";
        };

        "custom/microphone" = {
          format = "{}";
          exec = "microphone-status";
          tooltip = false;
          interval = 1;
          return-type = "json";
        };
        "custom/nc" = {
          format = "";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t";
        };
      };
    };
    style = ''
      * {
        border: none;
        font-family:'Inconsolata', 'FontAwesome';
        font-size: 12px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 15px;
      }

      window#waybar {
        background: transparent;
      }

      #clock,#workspaces,#tray,#network,#wireplumber,#battery,#backlight,#language,#custom-weather,#custom-microphone,#custom-nc,#custom-clock {
        color: #1e1e2e;
        background-color: #f5e0dc;
        border-radius: 5px;
        padding-left: 5px;
        padding-right: 5px;
        margin-top:5px;
        margin-right: 5px;
      }

      #custom-microphone {
        min-width: 10px;
      }

      #wireplumber, #network, #backlight, #battery {
        padding-right: 10px;
      }

      #workspaces button {
        padding-right: 10px;
      }

      #custom-nc {
        margin-right: 5px;  
      }

      #tray {
        font-size: 5px;
      }

      #workspaces button {
        color: #1e1e2e;
        min-width: 15px;
        background-color: #f5e0dc;
      }

      #workspaces button.active {
        background: #1e1e2e;
        color: #f5e0dc;
      }
    '';
  };
}
