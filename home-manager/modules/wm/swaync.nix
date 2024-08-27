{pkgs, ...}: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      widgets = [
        "volume"
        "backlight"
        "buttons-grid"
        "mpris"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = {
          text = " ";
        };
        label = {
          max-lines = 2;
          text = "Notification";
        };
        mpris = {
          image-size = 60;
          image-radius = 10;
        };
        volume.label = "";
        backlight.label = "󰃟";
        buttons-grid.actions = [
          {
            label = " Wi-Fi";
            command = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
          }
          {
            label = "󰂯 Bluetooth";
            command = "${pkgs.blueman}/bin/blueman-manager";
          }
        ];
      };
    };
    style = ''
      
    '';
  };
}
