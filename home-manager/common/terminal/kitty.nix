{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      font_family = "Inconsolata";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      scrollback_lines = 10000;
      enable_audio_bell = false;
      font_size = 20;
      background_opacity = 1;
      remember_window_size = false;
      linux_display_server = "wayland";
    };
  };
}
