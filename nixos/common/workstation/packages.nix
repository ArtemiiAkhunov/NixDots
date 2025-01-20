{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
    ];

  environment.systemPackages = with pkgs; [
    # Desktop Apps

    # General Apps

    audacity
    blender
    chromium
    telegram-desktop
    kitty
    kitty-themes
    obs-studio
    mpv
    vesktop
    element-desktop
    evince
    bottles
    qbittorrent
    kdePackages.kdenlive
    glaxnimate
    makemkv
    nautilus
    adwaita-icon-theme
    sushi
    imv
    thunderbird
    yubikey-manager-qt
    ventoy-full

    # Coding utilities

    android-tools

    # School Apps

    obsidian
    zoom-us
    libreoffice-still
    slack
    cura-appimage

    # Gaming

    retroarch
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
    qemu

    # Window Manager Requirements

    brightnessctl
    libnotify
    lxde.lxsession
    xdg-user-dirs
    xwayland
    waybar
    wttrbar
    (import ./scripts/microphone-status.nix { inherit pkgs; })
    (import ./scripts/handle_monitor_connect.nix { inherit pkgs; })
    swaynotificationcenter
    wl-clipboard
    hyprland
    hyprlock
    swww
    wofi
    xdg-desktop-portal-hyprland
    pipewire
    pavucontrol
    copyq
    grim
    grimblast
    slurp
    swappy
    papirus-nord

    # Networking

    networkmanager-l2tp
    networkmanagerapplet

    # GPU utilities

    lshw
    (import ./scripts/nvidia-offload.nix { inherit pkgs; })
    cudaPackages.cudatoolkit
  ];
}
