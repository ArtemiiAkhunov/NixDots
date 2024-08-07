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
    evince
    spotify
    bottles
    qbittorrent
    davinci-resolve
    makemkv
    cinnamon.nemo-with-extensions
    gvfs


    # School Apps
    
    obsidian
    zoom-us
    libreoffice-still

    # Gaming

    retroarch
    cockatrice

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
    brightnessctl
    bluez
    bluez-tools    
    killall
    libnotify
    lxde.lxsession
    xdg-user-dirs
    findutils
    bind
    fzf
    sl
    sherlock

    # GUI utils
    
    imv
    copyq
    ventoy-full

    # VPN

    networkmanager-l2tp
    networkmanagerapplet

    # Wayland stuff

    xwayland
    waybar
    wttrbar
    (import ./scripts/microphone-status.nix { inherit pkgs; })
    dunst
    wl-clipboard
    hyprlock
    swww 
    wofi
    xdg-desktop-portal-hyprland

    # Sound

    pipewire
    pavucontrol

    # GPU utilities

    lshw
    (import ./scripts/nvidia-offload.nix { inherit pkgs; })

    # Screenshotting
    
    grim
    grimblast
    slurp
    swappy

    #Other
    
    home-manager
    papirus-nord
    cacert
  ];

   fonts.packages = with pkgs; [
     font-awesome
     fira-code
     inconsolata
     nerdfonts
   ];

}
