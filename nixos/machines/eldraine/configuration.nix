{ lib, ... }:
{
  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8"; # locale

  networking.hostName = "eldraine";

  # Shared docker.nix assumes a btrfs root; eldraine is ext4.
  virtualisation.docker.storageDriver = lib.mkForce "overlay2";

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ]; # Flakes
  };

  system.stateVersion = "26.05"; # DO NOT TOUCH
}
