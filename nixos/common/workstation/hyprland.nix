{ pkgs, ... }:
let
  triggerActivate = (import ./scripts/triggerActivate.nix { inherit pkgs; });
in
{
  programs.hyprland.enable = true;

  xdg.portal = {
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.hyprland = {
      "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
    };
  };

  environment.systemPackages =
    with pkgs;
    [
      brightnessctl
      libnotify
      lxsession
      xdg-user-dirs
      xwayland
      waybar
      wttrbar
      swaynotificationcenter
      wl-clipboard
      hyprlock
      wofi
      pipewire
      pavucontrol
      copyq
      grim
      grimblast
      slurp
      eww
      swappy
      papirus-nord
    ]
    ++ [
      triggerActivate
    ];
}
