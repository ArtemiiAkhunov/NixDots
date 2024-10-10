{
  time.timeZone = "America/Indianapolis"; # timezone

  i18n.defaultLocale = "en_US.UTF-8"; # locale

  networking.hostName = "theros";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Flakes

  system.stateVersion = "24.05"; # DO NOT TOUCH
}
