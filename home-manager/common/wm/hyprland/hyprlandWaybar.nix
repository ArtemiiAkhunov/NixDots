{
  programs.waybar = {
    settings.mainBar = {
      position="top";

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
    };

    style = ''
      * {
        border: none;
        font-family:'Inconsolata', 'FontAwesome';
        font-size: 20px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 30px;
      }

      window#waybar {
        background: transparent;
      }

      #clock,#workspaces,#tray,#network,#wireplumber,#battery,#backlight,#language,#custom-weather,#custom-microphone,#custom-nc,#custom-clock {
        color: #1e1e2e;
        background-color: #f5e0dc;
        border-radius: 10px;
        padding-left: 10px;
        padding-right: 10px;
        margin-top:5px;
        margin-right: 5px;
      }

      #custom-microphone {
        min-width: 15px;
      }

      #wireplumber, #network, #backlight, #battery {
        padding-right: 20px;
      }

      #workspaces button {
        padding-right: 20px;
      }

      #custom-nc {
        margin-right: 10px;  
      }

      #tray {
        font-size:16px;
      }

      #workspaces button {
        color: #1e1e2e;
        min-width: 30px;
        background-color: #f5e0dc;
      }

      #workspaces button.active {
        background: #1e1e2e;
        color: #f5e0dc;
      }
    '';
  };
}
