{ ... }:
{
  services.tlp = {
    enable = true;
    settings =
      let
        sound_save_level = 10;
        min_bat_level = 40;
        max_bat_level = 90;
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

        # Battery
        START_CHARGE_THRESH_BAT0 = min_bat_level;
        STOP_CHARGE_THRESH_BAT0 = max_bat_level;

        # Disable watchdog
        NMI_WATCHDOG = 0;

        # WiFi
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";

        # Wake On LAN disable
        WOL_DISABLE = "Y";

        # Mem sleep
        MEM_SLEEP_ON_AC = "s2idle";
        MEM_SLEEP_ON_BAT = "deep";

        # CPU shenanigans:

        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # USB suspend:

        USB_AUTOSUSPEND = 1;
        USB_EXCLUDE_PHONE = 1;
      };
  };
}
