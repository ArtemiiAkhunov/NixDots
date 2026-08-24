{ lib, config, ... }:
let
  cfg = config.powersave;
in
{
  options.powersave.chargeThresholds = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.submodule {
        options = {
          start = lib.mkOption {
            type = lib.types.ints.between 0 100;
            description = "Resume charging once the battery falls below this percentage.";
          };
          stop = lib.mkOption {
            type = lib.types.ints.between 0 100;
            description = "Stop charging at this percentage, to reduce cell wear.";
          };
        };
      }
    );
    default = {
      start = 40;
      stop = 80;
    };
    example = null;
    description = ''
      Battery charge thresholds passed to TLP, or `null` to leave charging
      alone.

      These only do anything if the EC exposes
      `charge_control_start_threshold` / `charge_control_end_threshold` under
      {file}`/sys/class/power_supply/BAT0/`. TLP accepts the settings either
      way and fails silently when the files are absent, so check the sysfs
      paths on a new host before assuming a cap is in effect.
    '';
  };

  config = {
    services.tlp = {
      enable = true;
      settings =
        let
          sound_save_level = 10;
        in
        {
          TLP_DEFAULT_MODE = "AC";

          # Generic Power Profile:
          PLATFORM_PROFILE_ON_AC = "balanced";
          PLATFORM_PROFILE_ON_BAT = "low-power";

          # Sound
          SOUND_POWER_SAVE_ON_AC = sound_save_level;
          SOUND_POWER_SAVE_ON_BAT = sound_save_level;
          SOUND_POWER_SAVE_CONTROLLER = "Y";

          # Disable watchdog
          NMI_WATCHDOG = 0;

          # WiFi
          WIFI_PWR_ON_AC = "off";
          WIFI_PWR_ON_BAT = "on";

          # Wake On LAN disable
          WOL_DISABLE = "Y";

          # Mem sleep
          MEM_SLEEP_ON_AC = "s2idle";
          MEM_SLEEP_ON_BAT = "s2idle";

          # CPU shenanigans:

          CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

          # USB suspend:

          USB_AUTOSUSPEND = 1;
          USB_EXCLUDE_PHONE = 1;
        }
        // lib.optionalAttrs (cfg.chargeThresholds != null) {
          START_CHARGE_THRESH_BAT0 = cfg.chargeThresholds.start;
          STOP_CHARGE_THRESH_BAT0 = cfg.chargeThresholds.stop;
        };
    };
  };
}
