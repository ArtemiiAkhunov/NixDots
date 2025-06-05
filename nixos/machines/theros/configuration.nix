{
  time.timeZone = "America/Indianapolis"; # timezone

  i18n.defaultLocale = "en_US.UTF-8"; # locale

  networking.hostName = "theros";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "repl-flake"
  ]; # Flakes

  system.stateVersion = "24.11"; # DO NOT TOUCH
}
