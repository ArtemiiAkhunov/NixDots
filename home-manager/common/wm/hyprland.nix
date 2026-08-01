{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "lua";

    extraConfig = ''
      local mainMod = "SUPER"
      local terminal = "${pkgs.kitty}/bin/kitty"
      local browser = "${pkgs.firefox}/bin/firefox"
      local privateBrowser = "${pkgs.firefox}/bin/firefox --private-window google.com"
      local openSchedule = "${pkgs.imv}/bin/imv ~/Pictures/Schedule.png"
      local menu = "${pkgs.wofi}/bin/wofi --show drun"

      hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1.0,
      })

      hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
      hl.env("QR_QPA_PLATFORMTHEME", "qt5ct")

      hl.config({
        ecosystem = {
          no_update_news = true,
        },

        debug = {
          disable_logs = false,
        },

        input = {
          kb_layout = "us,ru",
          kb_options = "grp:win_space_toggle",

          follow_mouse = 1,

          touchpad = {
            natural_scroll = true,
            scroll_factor = 0.6,
            disable_while_typing = false,
          },

          accel_profile = "flat",
          sensitivity = 0.65,
        },

        general = {
          gaps_in = 5,
          gaps_out = 20,
          border_size = 2,
          col = {
            active_border = { colors = { "rgba(a6e3a1ee)", "rgba(74c7ecee)" }, angle = 45 },
            inactive_border = "rgba(b4befeee)",
          },

          layout = "master",

          allow_tearing = false,
        },

        decoration = {
          rounding = 10,

          blur = {
            enabled = false,
            size = 3,
            passes = 1,
            new_optimizations = true,
          },

          shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(f2cdcdee)",
          },
        },

        animations = {
          enabled = false,
        },

        master = {
          orientation = "left",
          slave_count_for_center_master = 0,
        },

        misc = {
          force_default_wallpaper = false,
          disable_hyprland_logo = true,
        },
      })

      hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

      hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
      hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
      hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "default" })

      hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
      })

      -- Pretty
      hl.window_rule({ match = { class = "kitty" }, opacity = 1 })
      hl.window_rule({ match = { class = "floating" }, float = true })
      hl.window_rule({ match = { float = true }, float = true })
      hl.window_rule({ match = { workspace = "special:magic" }, opacity = 1 })
      -- Wofi Visual
      hl.window_rule({ match = { class = "wofi" }, no_anim = true })

      -- Basic Stuff
      hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
      hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
      hl.bind(mainMod .. " + CONTROL + Q", hl.dsp.exit())
      hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
      hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
      hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
      hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(privateBrowser))
      -- Utilities
      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SINK@ toggle"))
      hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SOURCE@ toggle"))
      hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f -"))
      hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("${pkgs.grim}/bin/grim - | ${pkgs.swappy}/bin/swappy -f -"))
      hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("${pkgs.hyprlock}/bin/hyprlock"))
      hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("${pkgs.swaynotificationcenter}/bin/swaync-client -t"))
      -- Moving Around
      hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
      hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
      hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
      hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
      hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
      hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
      hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
      hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
      -- Workspaces: mainMod + [0-9] to focus, + SHIFT to move window
      for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
      end
      -- Special Workspaces
      hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("magic"))
      hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("schedule"))
      -- Mouse Moving
      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
      -- Funny
      hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("triggerActivate"))
      -- Repeating (was binde)
      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("${pkgs.brightnessctl}/bin/brightnessctl set 5%+"), { repeating = true })
      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("${pkgs.brightnessctl}/bin/brightnessctl set 5%-"), { repeating = true })
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_SINK@ 5%+"), { repeating = true })
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_SINK@ 5%-"), { repeating = true })
      -- Mouse binds (was bindm)
      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
      -- Lid switch (was bindl)
      hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("${pkgs.hyprlock}/bin/hyprlock"), { locked = true })

      hl.on("hyprland.start", function()
        hl.exec_cmd("${pkgs.hyprlock}/bin/hyprlock")
        hl.exec_cmd("${pkgs.swaynotificationcenter}/bin/swaync")
        hl.exec_cmd("${pkgs.copyq}/bin/copyq --start-server")
        hl.exec_cmd("${pkgs.networkmanagerapplet}/bin/nm-applet")
        hl.exec_cmd("monitorConnect")
        hl.exec_cmd("kdeconnect-indicator")
        hl.exec_cmd("${pkgs.waybar}/bin/waybar")
      end)

      hl.workspace_rule({ workspace = "special:magic", gaps_in = 40, gaps_out = 60 })
      hl.workspace_rule({ workspace = "special:schedule", on_created_empty = openSchedule })
      hl.workspace_rule({ workspace = "special:magic", on_created_empty = "spotify" })
    '';
  };
}
