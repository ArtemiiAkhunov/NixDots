{ pkgs, ... }:
{
  time.timeZone = null;

  networking.hostName = "kaldheim";

  # This HP EC exposes no charge_control_{start,end}_threshold under
  # /sys/class/power_supply/BAT0, so TLP's thresholds were silently no-ops.
  powersave.chargeThresholds = null;

  environment.systemPackages = with pkgs; [
    firefox
    libreoffice
    evince
    mpv
  ];

  system.stateVersion = "25.05"; # DO NOT TOUCH
}
