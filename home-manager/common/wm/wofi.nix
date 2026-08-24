{ config, ... }:
let
  px = config.ui.px;
  cssPx = n: "${toString (px n)}px";
in
{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      prompt = "";
      image_size = px 16;
      location = "center";
      lines = 10;
      line_wrap = "word";
      term = "kitty";
      width = "20%";
      hide_scroll = true;
    };
    style = ''
      * {
        font-size: ${cssPx 24};
        font-family: 'Inconsolata';
      }

      #window {
        margin: auto;
        padding: ${cssPx 10};
      }

      #input {
        padding: ${cssPx 10};
        margin-bottom: ${cssPx 10};
      }

      #img {
        margin-right: ${cssPx 6};
      }

      #entry {
        padding: ${cssPx 10};
      }

      #text {
        margin: ${cssPx 2};
      }
    '';
  };
}
