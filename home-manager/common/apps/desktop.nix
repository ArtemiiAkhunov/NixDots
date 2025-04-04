{ pkgs, ... }:
let
in
{
  xdg.desktopEntries = {
    kitty = {
      name = "Kitty";
      genericName = "Terminal Emulator";
      exec = "${pkgs.kitty}/bin/kitty --start-as=fullscreen %U";
      terminal = false;
      categories = [ "Application" "Terminal" ];
    }
  };
}
