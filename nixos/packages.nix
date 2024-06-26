{ pkgs, inputs, system, lib, ... }: {
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
    discord
    betterdiscordctl
    zathura
    spotify
    bottles
    qbittorrent
    davinci-resolve


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
    rustc
    cargo

    # CLI stuff

    fastfetch
    file
    tree
    wget
    git
    htop
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

    # GUI utils
    
    imv
    copyq

    # Wayland stuff

    xwayland
    waybar
    wttrbar
    dunst
    wl-clipboard
    xwaylandvideobridge
    hyprlock
    swww 
    wofi
    xdg-desktop-portal-hyprland

    # Sound

    pipewire
    helvum

    # GPU utilities

    lshw

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
