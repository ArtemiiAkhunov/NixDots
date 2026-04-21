{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 75;
        spacing = 4;

        # top → bottom on a vertical bar
        modules-left = [
          "custom/nc"
          "custom/clock"
          "custom/weather"
        ];

        modules-center = [ "niri/workspaces" ];

        modules-right = [
          "custom/microphone"
          "wireplumber"
          "network"
          "backlight"
          "battery"
          "tray"
        ];

        "tray" = {
          icon-size = 20;
          spacing = 6;
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
          };
        };

        "custom/clock" = {
          # TZ data messes with waybar's clock module
          # Show time on one line, date on the next via tooltip
          format = "{}";
          tooltip = true;
          exec = ''date +'{"text":"%H:%M","tooltip":"%A\n%d %b %Y"}'';
          return-type = "json";
          interval = 60;
        };

        "backlight" = {
          format = "{icon}";
          tooltip-format = "{percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery" = {
          battery = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
          tooltip-format = "{capacity}% — {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "network" = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "⚠";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ipaddr}/{cidr}";
          tooltip-format-disconnected = "Disconnected";
        };

        "wireplumber" = {
          format = "{icon}";
          format-muted = "󰝟";
          format-icons = [
            ""
            ""
            ""
          ];
          tooltip-format = "{volume}%";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
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
          format = "";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t";
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        border: none;
        font-family: 'Inconsolata', 'FontAwesome';
        font-size: 18px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 0;
        min-width: 0;
      }

      window#waybar {
        background: transparent;
      }

      /* Every pill: full width, vertical spacing */
      #clock,
      #workspaces,
      #tray,
      #network,
      #wireplumber,
      #battery,
      #backlight,
      #custom-weather,
      #custom-microphone,
      #custom-nc,
      #custom-clock {
        color: #1e1e2e;
        background-color: #f5e0dc;
        border-radius: 10px;
        padding: 8px 0;
        margin: 3px 5px;
      }

      /* Workspace column: no extra padding, buttons fill the pill */
      #workspaces {
        padding: 4px 0;
      }

      #workspaces button {
        color: #1e1e2e;
        background: transparent;
        padding: 6px 0;
        min-height: 28px;
        min-width: 65px;
        border-radius: 8px;
        transition: all 0.15s ease;
      }

      #workspaces button:hover {
        background: rgba(30, 30, 46, 0.15);
      }

      #workspaces button.active {
        background: #1e1e2e;
        color: #f5e0dc;
      }

      /* Tray icons are smaller — tighten its pill */
      #tray {
        font-size: 14px;
        padding: 6px 0;
      }

      /* Bell is the top item — give it breathing room from the screen edge */
      #custom-nc {
        margin-top: 8px;
      }

      /* Battery warning/critical colours */
      #battery.warning {
        color: #fe640b;
      }

      #battery.critical {
        color: #d20f39;
        animation: blink 1s linear infinite;
      }

      @keyframes blink {
        to { opacity: 0.5; }
      }
    '';
  };
}
