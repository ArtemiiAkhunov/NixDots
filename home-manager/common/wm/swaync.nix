{ config, ... }:
let
  px = config.ui.px;
  cssPx = n: "${toString (px n)}px";
in
{
  services.swaync = {
    enable = true;
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      control-center-width = px 500;
      control-center-margin-top = px 10;
      control-center-margin-bottom = px 20;
      control-center-margin-right = px 10;
      control-center-margin-left = 0;
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";

      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-window-width = px 600;
      notification-icon-size = px 50;
      notification-body-image-height = px 140;
      notification-body-image-width = px 180;

      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      fit-to-screen = false;
      keyboard-shortcuts = true;
      image-visibility = "when available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "volume"
        "backlight"
        "mpris"
        "dnd"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = {
          text = "Shush";
        };
        label = {
          max-lines = 2;
          text = "Notification";
        };
        mpris = {
          image-size = px 90;
          image-radius = px 10;
        };
        volume.label = "";
        backlight.label = "󰃟";
      };
    };
    style = ''
      * {
        all: unset;
        font-size: ${cssPx 14};
        font-family: "FiraCode Nerd Font Mono";
        transition: 200ms;
      }

      trough highlight {
        background: #cdd6f4;
      }

      scale trough {
        margin: 0rem 1rem;
        background-color: #313244;
        min-height: ${cssPx 8};
        min-width: ${cssPx 70};
      }

      slider {
        background-color: #89b4fa;
      }

      .floating-notifications.background .notification-row .notification-background {
        box-shadow: 0 0 ${cssPx 8} 0 rgba(0, 0, 0, 0.8), inset 0 0 0 ${cssPx 1} #313244;
        border-radius: ${cssPx 12.6};
        margin: ${cssPx 18};
        background-color: #1e1e2e;
        color: #cdd6f4;
        padding: 0;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: ${cssPx 7};
        border-radius: ${cssPx 12.6};
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        box-shadow: inset 0 0 ${cssPx 7} 0 #f38ba8;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: ${cssPx 7};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        font-size: ${cssPx 18};
        color: #cdd6f4;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
        color: #a6adc8;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        font-size: ${cssPx 14};
        color: #cdd6f4;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border-radius: ${cssPx 7};
        color: #cdd6f4;
        background-color: #313244;
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        margin: ${cssPx 7};
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #313244;
        color: #cdd6f4;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #74c7ec;
        color: #cdd6f4;
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: ${cssPx 7};
        padding: ${cssPx 2};
        border-radius: ${cssPx 6.3};
        color: #1e1e2e;
        background-color: #f38ba8;
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        background-color: #eba0ac;
        color: #1e1e2e;
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: #f38ba8;
        color: #1e1e2e;
      }

      .control-center {
        box-shadow: 0 0 ${cssPx 8} 0 rgba(0, 0, 0, 0.8), inset 0 0 0 ${cssPx 1} #313244;
        border-radius: ${cssPx 12.6};
        margin: ${cssPx 18};
        background-color: #1e1e2e;
        color: #cdd6f4;
        padding: ${cssPx 14};
      }

      .control-center .widget-title > label {
        color: #cdd6f4;
        font-size: 1.3em;
      }

      .control-center .widget-title button {
        border-radius: ${cssPx 7};
        color: #cdd6f4;
        background-color: #313244;
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        padding: ${cssPx 8};
      }

      .control-center .widget-title button:hover {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #585b70;
        color: #cdd6f4;
      }

      .control-center .widget-title button:active {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #74c7ec;
        color: #1e1e2e;
      }

      .control-center .notification-row .notification-background {
        border-radius: ${cssPx 7};
        color: #cdd6f4;
        background-color: #313244;
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        margin-top: ${cssPx 14};
      }

      .control-center .notification-row .notification-background .notification {
        padding: ${cssPx 7};
        border-radius: ${cssPx 7};
      }

      .control-center .notification-row .notification-background .notification.critical {
        box-shadow: inset 0 0 ${cssPx 7} 0 #f38ba8;
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: ${cssPx 7};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: #cdd6f4;
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: #a6adc8;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: #cdd6f4;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border-radius: ${cssPx 7};
        color: #cdd6f4;
        background-color: #11111b;
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        margin: ${cssPx 7};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #313244;
        color: #cdd6f4;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #74c7ec;
        color: #cdd6f4;
      }

      .control-center .notification-row .notification-background .close-button {
        margin: ${cssPx 7};
        padding: ${cssPx 2};
        border-radius: ${cssPx 6.3};
        color: #1e1e2e;
        background-color: #eba0ac;
      }

      .close-button {
        border-radius: ${cssPx 6.3};
      }

      .control-center .notification-row .notification-background .close-button:hover {
        background-color: #f38ba8;
        color: #1e1e2e;
      }

      .control-center .notification-row .notification-background .close-button:active {
        background-color: #f38ba8;
        color: #1e1e2e;
      }

      .control-center .notification-row .notification-background:hover {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #7f849c;
        color: #cdd6f4;
      }

      .control-center .notification-row .notification-background:active {
        box-shadow: inset 0 0 0 ${cssPx 1} #45475a;
        background-color: #74c7ec;
        color: #cdd6f4;
      }

      .notification.critical progress {
        background-color: #f38ba8;
      }

      .notification.low progress,
      .notification.normal progress {
        background-color: #89b4fa;
      }

      .control-center-dnd {
        margin-top: ${cssPx 5};
        border-radius: ${cssPx 8};
        background: #313244;
        border: ${cssPx 1} solid #45475a;
        box-shadow: none;
      }

      .control-center-dnd:checked {
        background: #313244;
      }

      .control-center-dnd slider {
        background: #45475a;
        border-radius: ${cssPx 8};
      }

      .widget-dnd {
        margin: ${cssPx 0};
        font-size: 1.1rem;
      }

      .widget-dnd > switch {
        font-size: initial;
        border-radius: ${cssPx 8};
        background: #313244;
        border: ${cssPx 1} solid #45475a;
        box-shadow: none;
      }

      .widget-dnd > switch:checked {
        background: #313244;
      }

      .widget-dnd > label {
        font-size:${cssPx 24};
      }

      .widget-dnd > switch slider {
        background: #45475a;
        border-radius: ${cssPx 8};
        border: ${cssPx 1} solid #6c7086;
      }

      .widget-mpris .widget-mpris-player {
        background: #313244;
        padding: ${cssPx 7};
      }

      .widget-mpris .widget-mpris-title {
        font-size: 1.2rem;
      }

      .widget-mpris .widget-mpris-subtitle {
        font-size: 0.8rem;
      }

      .widget-menubar > box > .menu-button-bar > button > label {
        font-size: 3rem;
        padding: 0.5rem 2rem;
      }

      .widget-menubar > box > .menu-button-bar > :last-child {
        color: #f38ba8;
      }

      .power-buttons button:hover,
      .powermode-buttons button:hover,
      .screenshot-buttons button:hover {
        background: #313244;
      }

      .control-center .widget-label > label {
        color: #cdd6f4;
        font-size: 2rem;
      }

      .widget-buttons-grid {
        padding-top: 1rem;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button label {
        font-size: 2.5rem;
      }

      .widget-volume {
        padding-top: 1rem;
      }

      .widget-volume label {
        font-size: 1.5rem;
        color: #74c7ec;
      }

      .widget-volume trough highlight {
        background: #74c7ec;
      }

      .widget-backlight trough highlight {
        background: #f9e2af;
      }

      .widget-backlight label {
        font-size: 1.5rem;
        color: #f9e2af;
      }

      .widget-backlight .KB {
        padding-bottom: 1rem;
      }

      .image {
        padding-right: 0.5rem;
      }
    '';
  };
}
