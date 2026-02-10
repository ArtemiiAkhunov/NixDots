{ pkgs, ... }:
{
  nix = {
    package = pkgs.lix;
    settings = {
      auto-optimise-store = true;
      substituters = [
        "https://hydra.lordofthelags.net"
        "https://nixos-raspberrypi.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      trusted-public-keys = [
        "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
        "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
        "hydra.lordofthelags.net:v3OFf3HWmShqFqJIYCBRDVGpFxyq9Pc8QMflK8hcOYE="
      ];
    };
  };
}
