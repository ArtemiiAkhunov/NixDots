{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "eDP-1";
          path = "~/.wallpaper/cat.png";
          fit_mode = "cover";
        }
      ];
    };
  };
}
