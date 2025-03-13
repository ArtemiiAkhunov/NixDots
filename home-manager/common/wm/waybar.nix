{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 70;
        spacing = 10;

        "tray" = {
          icon-size = 24;
          spacing = 10;
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
  };
}
