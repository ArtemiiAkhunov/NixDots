{
  pkgs,
  config,
  lib,
  ...
}:
let
  px = config.ui.px;
  cssPx = n: "${toString (px n)}px";

  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";

  wsIds = lib.range 1 10;
  # Every workspace used the same glyph in the original format-icons.
  wsIcon = "";

  # Hyprland's lua config manager (hyprland.nix: configType = "lua") evaluates
  # IPC `dispatch` as Lua, so waybar's built-in hyprland/workspaces click --
  # which sends the legacy `dispatch workspace N` -- is a Lua syntax error and
  # silently does nothing. Waybar has no per-button click hook, so each
  # workspace needs its own module to route the click to the right target.
  # ponytail: 1s poll per module; move to `signal` if the wakeups ever matter.
  wsStatus = pkgs.writeShellScript "waybar-ws-status" ''
    ${hyprctl} --batch "j/activeworkspace;j/workspaces" \
      | ${pkgs.jq}/bin/jq -sc --argjson id "$1" --arg icon "$2" \
          '{ text: (if (.[1] | any(.id == $id)) then $icon else "" end),
             class: (if .[0].id == $id then "active" else "occupied" end) }'
  '';

  wsModules = lib.listToAttrs (
    map (
      i:
      lib.nameValuePair "custom/ws${toString i}" {
        format = "{}";
        return-type = "json";
        interval = 1;
        exec = "${wsStatus} ${toString i} '${wsIcon}'";
        on-click = "${hyprctl} dispatch 'hl.dsp.focus({workspace=${toString i}})'";
        tooltip = false;
      }
    ) wsIds
  );

  wsSelector = suffix: lib.concatMapStringsSep "," (i: "#custom-ws${toString i}${suffix}") wsIds;
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

        modules-center = map (i: "custom/ws${toString i}") wsIds;

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
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{capacity}% {time} {icon}";
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
      }
      // wsModules;
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

      #clock,${wsSelector ""},#tray,#network,#wireplumber,#battery,#backlight,#language,#custom-weather,#custom-microphone,#custom-nc,#custom-clock {
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

      /* The `states` above make waybar add these classes; without rules for
         them a critical battery looked identical to a full one. */
      #battery.charging, #battery.plugged {
        background-color: #a6e3a1;
      }

      #battery.warning:not(.charging) {
        background-color: #fab387;
      }

      #battery.critical:not(.charging) {
        background-color: #f38ba8;
        color: #f5e0dc;
      }

      #custom-nc {
        margin-right: ${cssPx 10};  
      }

      #tray {
        font-size: ${cssPx 16};
      }

      ${wsSelector ""} {
        min-width: ${cssPx 30};
        margin-right: 0;
        padding-left: ${cssPx 5};
        padding-right: ${cssPx 5};
      }

      ${wsSelector ".active"} {
        background-color: #1e1e2e;
        color: #f5e0dc;
      }
    '';
  };
}
