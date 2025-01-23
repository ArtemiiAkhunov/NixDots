{ lib, ... }:
{
  time.timeZone = lib.mkForce null; # "America/Indianapolis";

  i18n.defaultLocale = "en_US.UTF-8"; # locale

  networking.hostName = "kamigawa";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Flakes

  system.stateVersion = "24.05"; # DO NOT TOUCH
}
