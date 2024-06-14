{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
      layer = "top";
      position = "top";
      height = 50;
      spacing = 4;
      modules-left = [ "clock" "tray"];
      modules-center = ["hyprland/workspaces"];
      modules-right = ["wireplumber" "network" "backlight" "hyprland/language" "battery"];
      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "󰯰";
            "7" = "󰰠";
            "8" = "󰰩";
            "9" = "󰰂";
            "10" = "󰯈";
        };
      };

      "tray" = {
        icon-size = 16;
        spacing = 10;
      };

      "clock" = {
        format = "{:%H:%M %m/%d}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      "backlight" = {
        format = "{percent}% {icon}";
        format-icons =  [ "" "" "" "" "" "" "" "" "" ];
      };

      "battery" = {
        states = {
            warning = 30;
            critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [ "" "" "" "" "" ];
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
        on-click = "helvum";
      };

      "hyprland/language" = {
        format = "{shortDescription}";
      };

      "custom/weather" = {
        format = "{}°";
        tooltip = true;
        interval = 3600;
        exec = "wttrbar --location 'West Lafayette'";
        return-type = "json";
      };
    };
    };
    style =
      ''

* {
    border: none;
    font-family:'Inconsolata', 'FontAwesome';
    font-size: 14px;
    font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
    min-height: 30px;
}


window#waybar {
    background: transparent;
}

#clock,#workspaces,#tray,#network,#wireplumber,#battery,#backlight,#language,#custom-weather {
    color: #1e1e2e;
    background-color: #f5e0dc;
    border-radius: 10px;
    padding-left: 10px;
    padding-right: 10px;
    margin-top:5px;
    margin-right: 5px;
}

#tray {
    font-size:10px;
}

#workspaces button {
    color: #1e1e2e;
    background-color: #f5e0dc;
}

#workspaces button.active {
    background: #f5e0dc;
    color: #11111b;
}
      '';
  };
}
