{ pkgs, lib, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    # Desktop Apps
    
    # General Apps
    
    audacity
    firefox
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
    gnome.nautilus
    gnome.adwaita-icon-theme
    gnome.sushi
    imv
    ventoy-full


    # School Apps
    
    obsidian
    zoom-us
    libreoffice-still

    # Gaming

    retroarch
    cockatrice
    lutris
    heroic
    mangohud
    protonup

    # Coding utilities
    
    gnumake
    gcc
    python
    (python3.withPackages (ps: with ps; [ requests ]))
    python311Packages.debugpy
    vscode-extensions.ms-vscode.cpptools
    gdb
    rustc
    cargo
    android-tools

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
    home-manager
    papirus-nord

    # CLI stuff

    fastfetch
    file
    tree
    wget
    git
    btop
    unzip
    cava
    zip
    bluez
    bluez-tools
    killall
    findutils
    bind
    fzf
    sl
    sherlock
    ripgrep
    gvfs
    qemu

    # Networking

    networkmanager-l2tp
    networkmanagerapplet
    cacert

    # GPU utilities

    lshw
    (import ./scripts/nvidia-offload.nix { inherit pkgs; })

  ];

   fonts.packages = with pkgs; [
     font-awesome
     fira-code
     inconsolata
     nerdfonts
   ];

}
