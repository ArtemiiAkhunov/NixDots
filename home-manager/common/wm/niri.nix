{ pkgs, ... }:
{
  xdg.configFile."niri/config.kdl".source = pkgs.replaceVars ./niri.kdl {
    wireplumber = "${pkgs.wireplumber}";
    copyq = "${pkgs.copyq}";
    hyprlock = "${pkgs.hyprlock}";
    wofi = "${pkgs.wofi}";
    brightnessctl = "${pkgs.brightnessctl}";
    kitty = "${pkgs.kitty}";
    waybar = "${pkgs.waybar}";
    satelite = "${pkgs.xwayland-satellite}";
    swww = "${pkgs.swww}";
    networkmanagerapplet = "${pkgs.networkmanagerapplet}";
    DEFAULT_AUDIO_SINK = null;
    DEFAULT_AUDIO_SOURCE = null;
  };
}
