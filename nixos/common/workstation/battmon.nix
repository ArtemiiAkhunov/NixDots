{pkgs, ...}: 
let
  battmon = pkgs.writeShellScriptBin "battmon" ''
    HIGH_THRESHOLD=95
    LOW_THRESHOLD=15
    LOGFILE="/tmp/battmon.log"

    # Get the battery level
    LEVEL=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gawk}/bin/awk -F', ' '{print $2}' | tr -d '%,')

    # Ensure LEVEL is a valid number
    if [[ "$LEVEL" =~ ^[0-9]+$ ]]; then
        # Check for high battery level
        if [ "$LEVEL" -ge "$HIGH_THRESHOLD" ]; then
            echo "$(date) - Battery at $LEVEL%. Sending high battery notification..." >> "$LOGFILE"
            DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 ${pkgs.libnotify}/bin/notify-send -t 0 "Battery Full" "Your battery is now fully charged." >> "$LOGFILE" 2>&1
        fi

        # Check for low battery level
        if [ "$LEVEL" -le "$LOW_THRESHOLD" ]; then
            echo "$(date) - Battery at $LEVEL%. Sending low battery warning..." >> "$LOGFILE"
            DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 ${pkgs.libnotify}/bin/notify-send -u critical -t 0 "Battery Low" "Your battery is critically low. Please plug in your charger!" >> "$LOGFILE"
        fi
    fi
  '';
in
{
  environment.systemPackages = [
    battmon
  ];
  systemd.timers."battery-check" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "battery-check.service";
    };
  };

  systemd.services."battery-check" = {
    script = ''
      ${battmon}/bin/battmon
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "voidwalker";
      RunAfterExit = true;
    };
  };
}
