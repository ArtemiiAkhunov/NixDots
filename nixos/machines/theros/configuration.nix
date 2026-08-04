{
  time.timeZone = "America/Chicago";

  networking.hostName = "theros";

  system.autoUpgrade = {
    enable = true;
    flake = "github:ArtemiiAkhunov/NixDots";
    dates = "04:30";
    randomizedDelaySec = "30min";
  };

  system.stateVersion = "24.11"; # DO NOT TOUCH
}
