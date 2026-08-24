{ config, lib, ... }:
# No programs.firefox and no files inside any profile: the scale is baked into
# the package wrapper via autoconfig, so profiles.ini and all profile state are
# left untouched. See ui.firefoxPackage.
lib.mkIf (config.ui.browserScale != null) {
  # Ahead of the system-wide firefox on PATH, so the shell and the Hyprland
  # keybind launch the same binary.
  home.packages = [ config.ui.firefoxPackage ];
}
