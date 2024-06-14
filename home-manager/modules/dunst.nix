{pkgs, ...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 300;
        height = "(10, 300)";
        origin = "top-right";
        offset = "20x20";
        scale = 0;
        notification_limit = 20;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 0;
        icon_corner_radius = 0;
        indicate_hidden = true;
        transparency = 0;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 3;
        frame_color = "#cba6f7";
        gap_size = 0;
        separator_color = "frame";
        sort=true;
        font = "Inconsolata 14";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        allignment = "left";
        vertical_allignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus";
        icon_path = "${pkgs.papirus-icon-theme}";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        sticky_history = true;
        history_length = 20;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 5;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_right_click = "do_action, close_current";
        mouse_middle_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
      };
      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#f38ba8";
        timeout = 20;
      };
    };
  };
}
