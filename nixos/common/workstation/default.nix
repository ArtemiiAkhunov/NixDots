{
  imports = [
    ./automount.nix
    ./bluetooth.nix
    ./cups.nix
    ./displaymanager.nix
    ./env.nix
    ./firewall.nix
    ./fprintd.nix
    # ./hyprland.nix Solved in flake.nix
    ./kanata.nix
    ./nautilus.nix
    ./networkmanager.nix
    # ./niri.nix
    ./packages.nix
    ./powersave.nix
    ./sound.nix
    ./steam.nix
    ./xdg.nix
    ./yubikey.nix
  ];
}
