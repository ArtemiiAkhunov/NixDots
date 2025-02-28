{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      prompt = "";
      image_size = 16;
      location = "center";
      lines = 10;
      line_wrap = "word";
      term = "kitty";
      width = "20%";
      hide_scroll = true;
    };
    style = ''
      * {
        font-size: 24px;
        font-family: 'Inconsolata';
      }

      #window {
        margin: auto;
        padding: 10px;
      }

      #input {
        padding: 10px;
        margin-bottom: 10px;
      }

      #img {
        margin-right: 6px;
      }

      #entry {
        padding: 10px;
      }

      #text {
        margin: 2px;
      }
    '';
  };
}
