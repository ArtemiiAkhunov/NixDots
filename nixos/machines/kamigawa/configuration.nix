{
  time.timeZone = "America/Chicago";

  networking.hostName = "kamigawa";

  # ASUS board WMI hotkeys emit spurious KEY_WLAN, soft-blocking wifi via rfkill
  boot.blacklistedKernelModules = [ "eeepc_wmi" ];

  system.stateVersion = "24.05"; # DO NOT TOUCH
}
