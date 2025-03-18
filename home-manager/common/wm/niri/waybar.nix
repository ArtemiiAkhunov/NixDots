{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "right";
        height = 20;
        spacing = 10;
        modules-left = [ ];
        modules-center = [ ];
        modules-right = [ ];
      };
    };
  };
}
