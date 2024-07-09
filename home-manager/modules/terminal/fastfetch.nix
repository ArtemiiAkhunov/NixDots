{
  programs.fastfetch = {
    enable = true;
    settings = {
      schema = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
         type = "kitty-direct";
         source = "ryo.png";
         width =  40;
         height = 16;
      };
      display = {
        separator =  " ";
      };
      modules = [
        {
          type = "custom"; #HardwareStart
          format = "┌─────────── Hardware Information ───────────┐"; #`\u001b` is `\033`, or `\e`
        }
        {
          type = "cpu";
          key = "  ";
        }
        {
          type = "gpu";
          key = "  ";
        }
        {
          type = "memory";
          key = "  󰑭";
        }
        {
          type = "swap";
          key = "  󰓡";
        }
        {
          type = "battery";
          key = "  ";
        }
        {
          type = "custom"; # SoftwareStart
          format = "├─────────── Software Information ───────────┤";
        }
        {
          type = "title";
          key = "  ";
          format = "{2}";
        }
        {
          type = "os";
          key = "  "; #Just get your distro's logo off nerdfonts.com
        }
        {
          type = "wm";
          key = "  ";
        }
        {
          type = "terminal";
          key = "  ";
        }
        {
          type = "terminalfont";
          key = "  ";
        }
        {
          type = "packages";
          key = "  󰏖";
        }
        {
          type = "uptime";
          key = "  󰅐";
        }
        {
          type = "custom"; #InformationEnd
          format = "└────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
