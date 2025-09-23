{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  microphoneStatus = (import ./scripts/microphoneStatus.nix { inherit pkgs; });
  monitorConnect = (import ./scripts/monitorConnect.nix { inherit pkgs; });
  triggerActivate = (import ./scripts/triggerActivate.nix { inherit pkgs; });
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [
        mgba
        melonds
        ppsspp
      ]
    )
  );
  customPackages = [
    microphoneStatus
    monitorConnect
    retroarchWithCores
    triggerActivate
  ];
in
{
  nixpkgs.config = {
    allowUnfreePredicate = 
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
      ];
    android_sdk.accept_license = true;
  };

  environment.systemPackages =
    with pkgs;
    [
      # Desktop Apps

      # General Apps

      audacity
      blender
      firefox
      telegram-desktop
      kitty
      kitty-themes
      obs-studio
      mpv
      vesktop
      element-desktop
      evince
      (bottles.override {
        removeWarningPopup = true;
      })
      qbittorrent
      kdePackages.kdenlive
      glaxnimate
      makemkv
      helvum
      nautilus
      adwaita-icon-theme
      sushi
      imv
      thunderbird
      yubioath-flutter
      darktable

      # Coding utilities

      android-tools
      vscode
      android-studio

      # School Apps

      obsidian
      zoom-us
      libreoffice-still
      slack
      cura-appimage

      # Gaming

      cockatrice
      lutris
      heroic
      mangohud
      protonup
      prismlauncher

      # CLI stuff

      cava
      bluez
      bluez-tools
      sherlock
      gvfs
      jdk17
      flutter
      yt-dlp
      qemu

      # Window Manager Requirements

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
      swww
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

      # Networking

      networkmanager-l2tp
      networkmanagerapplet

      # GPU utilities

      lshw
    ]
    ++ customPackages;
}
