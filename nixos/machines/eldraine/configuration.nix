{
  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8"; # locale

  networking.hostName = "eldraine";

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ]; # Flakes
  };

  system.stateVersion = "26.05"; # DO NOT TOUCH
}
