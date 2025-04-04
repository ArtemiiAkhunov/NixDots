{ pkgs, ... }:
let
in
{
  xdg.desktopEntries = {
    kitty = {
      name = "Kitty";
      genericName = "Terminal Emulator";
      exec = "${pkgs.kitty}/bin/kitty --start-as maximized %U";
      terminal = false;
      categories = [ "Utility" "TerminalEmulator" ];
      icon="kitty";
    };
  };
}
