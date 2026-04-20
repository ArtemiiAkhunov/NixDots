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
      discord # I love vesktop but discord doesnt
      betterdiscordctl
      element-desktop
      evince
      (bottles.override {
        removeWarningPopup = true;
      })
      alsa-scarlett-gui
      qbittorrent
      glaxnimate
      makemkv
      crosspipe
      nautilus
      adwaita-icon-theme
      sushi
      imv
      thunderbird
      yubioath-flutter
      darktable
      tigervnc
      postman

      # Coding utilities

      nss
      vscode
      claude-code

      # School Apps

      obsidian
      zoom-us
      libreoffice-still
      slack
      cura-appimage
      openconnect

      # Audio Effects
      carla
      guitarix
      gxplugins-lv2
      calf
      lsp-plugins
      x42-plugins
      zam-plugins
      dragonfly-reverb
      ir-lv2

      # Gaming

      cockatrice
      lutris
      heroic
      mangohud
      protonup-ng
      prismlauncher

      # CLI stuff

      cava
      bluez
      bluez-tools
      openseeface
      sherlock
      gvfs
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
