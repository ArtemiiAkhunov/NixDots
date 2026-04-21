{ pkgs, config, ... }:
let
  home = config.home.homeDirectory;
  screenshotArea = pkgs.writeShellScript "screenshot-area" ''
    ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f -
  '';
  screenshotFull = pkgs.writeShellScript "screenshot-full" ''
    ${pkgs.grim}/bin/grim - | ${pkgs.swappy}/bin/swappy -f -
  '';
  # Toggles the named "spotify" workspace: switches to it (launching Spotify if
  # empty) or jumps back to the previously-focused workspace if already there.
  toggleSpotify = pkgs.writeShellScript "toggle-spotify" ''
    focused_name=$(${pkgs.niri}/bin/niri msg -j workspaces \
      | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused == true) | .name // empty')

    if [ "$focused_name" = "spotify" ]; then
      ${pkgs.niri}/bin/niri msg action focus-workspace-previous
    else
      ${pkgs.niri}/bin/niri msg action focus-workspace "spotify"
      if ! pgrep -f spotify > /dev/null 2>&1; then
        spotify &
      fi
    fi
  '';
in
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "${pkgs.hyprlock}/bin/hyprlock";
      }
      {
        event = "before-sleep";
        command = "${pkgs.hyprlock}/bin/hyprlock";
      }
    ];
  };

  xdg.configFile."niri/config.kdl".text = ''
    input {
      keyboard {
        xkb {
          layout "us,ru"
          options "grp:win_space_toggle"
        }
      }

      touchpad {
        natural-scroll
        scroll-factor 0.6
      }

      mouse {
        accel-profile "flat"
        accel-speed 0.65
      }

      focus-follows-mouse
    }

    output "eDP-1" {
      scale 1.0
    }

    layout {
      gaps 10

      default-column-width { proportion 0.5; }

      border {
        width 2
        active-color "#a6e3a1ee"
        inactive-color "#b4befeee"
      }
    }

    prefer-no-csd

    spawn-at-startup "${pkgs.hyprlock}/bin/hyprlock"
    spawn-at-startup "${pkgs.swaynotificationcenter}/bin/swaync"
    spawn-at-startup "${pkgs.copyq}/bin/copyq" "--start-server"
    spawn-at-startup "${pkgs.networkmanagerapplet}/bin/nm-applet"
    spawn-at-startup "kdeconnect-indicator"
    spawn-at-startup "${pkgs.waybar}/bin/waybar"
    spawn-at-startup "${pkgs.swaybg}/bin/swaybg" "-o" "*" "-i" "${home}/.wallpaper/cat.png" "-m" "fill"

    window-rule {
      match app-id="kitty"
      opacity 0.8
    }

    window-rule {
      match app-id="spotify"
      opacity 0.8
    }

    binds {
      // Applications
      Mod+Return { spawn "${pkgs.kitty}/bin/kitty"; }
      Mod+D { spawn "${pkgs.wofi}/bin/wofi" "--show" "drun"; }
      Mod+B { spawn "${pkgs.firefox}/bin/firefox"; }
      Mod+Shift+B { spawn "${pkgs.firefox}/bin/firefox" "--private-window" "google.com"; }

      // Window management
      Mod+Shift+Q { close-window; }
      Mod+Ctrl+Q { quit; }
      Mod+Shift+F { toggle-window-floating; }
      Mod+F { fullscreen-window; }
      Mod+R { switch-preset-column-width; }

      // Focus movement (vim-like)
      Mod+H { focus-column-left; }
      Mod+L { focus-column-right; }
      Mod+K { focus-window-up; }
      Mod+J { focus-window-down; }

      // Move windows
      Mod+Shift+H { move-column-left; }
      Mod+Shift+L { move-column-right; }
      Mod+Shift+K { move-window-up; }
      Mod+Shift+J { move-window-down; }

      // Workspace switching (1-10)
      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }
      Mod+6 { focus-workspace 6; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }
      Mod+0 { focus-workspace 10; }

      // Move window to workspace
      Mod+Shift+1 { move-window-to-workspace 1; }
      Mod+Shift+2 { move-window-to-workspace 2; }
      Mod+Shift+3 { move-window-to-workspace 3; }
      Mod+Shift+4 { move-window-to-workspace 4; }
      Mod+Shift+5 { move-window-to-workspace 5; }
      Mod+Shift+6 { move-window-to-workspace 6; }
      Mod+Shift+7 { move-window-to-workspace 7; }
      Mod+Shift+8 { move-window-to-workspace 8; }
      Mod+Shift+9 { move-window-to-workspace 9; }
      Mod+Shift+0 { move-window-to-workspace 10; }

      // Scroll through workspaces with mousewheel
      Mod+WheelScrollDown { focus-workspace-down; }
      Mod+WheelScrollUp { focus-workspace-up; }

      // Mouse drag/resize
      Mod+MouseLeft { drag-window; }
      Mod+MouseRight { resize-window; }

      // Media keys
      XF86AudioMute { spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_SINK@" "toggle"; }
      XF86AudioMicMute { spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_SOURCE@" "toggle"; }
      XF86AudioRaiseVolume allow-when-locked=true { spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "-l" "1.4" "@DEFAULT_SINK@" "5%+"; }
      XF86AudioLowerVolume allow-when-locked=true { spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "-l" "1.4" "@DEFAULT_SINK@" "5%-"; }
      XF86MonBrightnessUp { spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "5%+"; }
      XF86MonBrightnessDown { spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "5%-"; }

      // Screenshots
      Mod+Shift+Print { spawn "${screenshotArea}"; }
      Mod+Print { spawn "${screenshotFull}"; }

      // Spotify scratchpad-style workspace
      Mod+M { spawn "${toggleSpotify}"; }

      // Utilities
      Mod+Shift+C { spawn "${pkgs.hyprlock}/bin/hyprlock"; }
      Mod+N { spawn "${pkgs.swaynotificationcenter}/bin/swaync-client" "-t"; }
      Mod+A { spawn "triggerActivate"; }
    }
  '';
}
