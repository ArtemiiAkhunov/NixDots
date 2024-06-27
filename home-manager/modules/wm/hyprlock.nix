{pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        no_fade_in = true;
        no_fade_out = true;
        ignore_empty_input = true;
      };
      background = {
        path = "$HOME/.wallpaper/cat.png";
        blur_passes = 3;
        blur_size = 8;
      };

      input-field = {
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(205, 214, 244)";
        fade_on_empty = false;
        font_family = "Inconsolata";
        placeholder_text = ''<i><span foreground="##cdd6f4">Input Password...</span></i>'';
        hide_input = false;
        position = "0, -120";
        halign = "center";
        valign = "center";
      };

      image = {
        path = "$HOME/.local/share/fastfetch/logos/ryo.png";
        position = "0, 175";
        size = "100, 100";
        rounding = -2;
        border_color = "rgb(243, 139, 168)";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
          color = "rgb(243, 139, 168)";
          font_size = 120;
          font_family = "Inconsolata";
          position = "0, -300";
          halign = "center";
          valign = "top";
        }
        {
          text = "Hi there $USER!";
          color = "rgb(243, 139, 168)";
          font_size = 25;
          font_family = "Inconsolata";
          position = "0, -40";
          halign = "center";
          valign = "center";
        }
      ];


    };
  };
}
