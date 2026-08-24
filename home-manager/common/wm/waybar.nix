{ pkgs, config, ... }:
let
  px = config.ui.px;
  cssPx = n: "${toString (px n)}px";
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = px 70;
        spacing = px 10;

        modules-left = [
          "custom/clock"
          "tray"
          "custom/weather"
        ];

        modules-center = [ "hyprland/workspaces" ];

        modules-right = [
          "custom/microphone"
          "wireplumber"
          "network"
          "backlight"
          "hyprland/language"
          "battery"
          "custom/nc"
        ];

        "tray" = {
          icon-size = px 24;
          spacing = px 10;
        };

        "hyprland/workspaces" = {
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

        "hyprland/language" = {
          format = "{shortDescription}";
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
        font-size: ${cssPx 20};
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: ${cssPx 30};
      }

      window#waybar {
        background: transparent;
      }

      #clock,#workspaces,#tray,#network,#wireplumber,#battery,#backlight,#language,#custom-weather,#custom-microphone,#custom-nc,#custom-clock {
        color: #1e1e2e;
        background-color: #f5e0dc;
        border-radius: ${cssPx 10};
        padding-left: ${cssPx 10};
        padding-right: ${cssPx 10};
        margin-top: ${cssPx 5};
        margin-right: ${cssPx 5};
      }

      #custom-microphone {
        min-width: ${cssPx 15};
      }

      #wireplumber, #network, #backlight, #battery {
        padding-right: ${cssPx 20};
      }

      #workspaces button {
        padding-right: ${cssPx 20};
      }

      #custom-nc {
        margin-right: ${cssPx 10};  
      }

      #tray {
        font-size: ${cssPx 16};
      }

      #workspaces button {
        color: #1e1e2e;
        min-width: ${cssPx 30};
        background-color: #f5e0dc;
      }

      #workspaces button.active {
        background: #1e1e2e;
        color: #f5e0dc;
      }
    '';
  };
}
