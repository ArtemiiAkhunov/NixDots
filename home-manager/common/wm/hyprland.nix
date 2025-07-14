{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "$SUPER";
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$browser" = "${pkgs.firefox}/bin/firefox";
      "$privateBrowser" = "${pkgs.firefox}/bin/firefox --private-window google.com";
      "$openSchedule" = "${pkgs.imv}/bin/imv ~/Pictures/Schedule.png";
      "$menu" = "${pkgs.wofi}/bin/wofi --show drun";

      monitor = ",preffered,auto,1.0";

      ecosystem."no_update_news" = true;

      env = [
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "QR_QPA_PLATFORMTHEME,qt5ct"
      ];

      debug = {
        disable_logs = false;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.6;
          disable_while_typing = false;
        };

        accel_profile = "flat";
        sensitivity = 0.65;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(a6e3a1ee) rgba(74c7ecee) 45deg";
        "col.inactive_border" = "rgba(b4befeee)";

        layout = "master";

        allow_tearing = false;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(f2cdcdee)";
        };
      };

      animations = {
        enabled = false;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows,         1, 7,  myBezier"
          "windowsOut,      1, 7,  default, popin 80%"
          "border,          1, 10, default"
          "borderangle,     1, 8,  default"
          "fade,            1, 7,  default"
          "workspaces,      1, 6,  default"
        ];
      };

      master = {
        orientation = "left";
        slave_count_for_center_master = 0;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = false;
        disable_hyprland_logo = true;
      };

      windowrulev2 = [
        # Pretty
        "opacity 0.8,class:^(kitty)$"
        "float, class:^(floating)$"
        "float, floating:1"
        "opacity 0.8,workspace:special:magic"
        # Wofi Visual
        "noanim,class:^(wofi)$"
      ];

      bind = [
        # Basic Stuff
        "$mainMod, Return, exec, $terminal"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod Control, Q, exit, "
        "$mainMod SHIFT, F, togglefloating,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, D, exec, $menu"
        "$mainMod, B, exec, $browser"
        "$mainMod SHIFT, B, exec, $privateBrowser"
        # Utilities
        ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SOURCE@ toggle"
        ''$mainMod SHIFT, Print, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f - ''
        ''$mainMod, Print, exec, ${pkgs.grim}/bin/grim - | ${pkgs.swappy}/bin/swappy -f -''
        "$mainMod SHIFT, C, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "$mainMod, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t"
        # Moving Around
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Special Workspaces
        "$mainMod, M, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, togglespecialworkspace, schedule"
        # Mouse Moving
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        # Funny
        "$mainMod, A, exec, triggerActivate"
      ];

      binde = [
        ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
        ",XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_SINK@ 5%-"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [ ",switch:on:Lid Switch,exec,${pkgs.hyprlock}/bin/hyprlock" ];

      exec-once = [
        "${pkgs.hyprlock}/bin/hyprlock"
        "${pkgs.swww}/bin/swww-daemon"
        "${pkgs.swww}/bin/swww img ~/.wallpaper/cat.png --transition-type none"
        "${pkgs.swaynotificationcenter}/bin/swaync"
        "${pkgs.copyq}/bin/copyq --start-server"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
        "monitorConnect"
        "kdeconnect-indicator"
        "${pkgs.waybar}/bin/waybar"
      ];

      workspace = [
        "special:magic, gapsin:40, gapsout:60"
        "special:schedule, on-created-empty:$openSchedule"
        "special:magic, on-created-empty:spotify"
      ];
    };
  };
}
