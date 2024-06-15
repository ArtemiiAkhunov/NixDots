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
    
    cinnamon.nemo
    audacity
    firefox
    telegram-desktop
    kitty
    kitty-themes
    obs-studio
    mpv
    discord
    zathura
    spotify
    bottles

    # School Apps
    
    obsidian
    zoom-us
    libreoffice-still

    # Gaming

    steam
    steamPackages.steam
    steam-run
    retroarch
    cockatrice

    # Coding utilities
    
    gnumake
    gcc
    python
    (python3.withPackages (ps: with ps; [ requests ]))

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
    swaylock
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

    # Display Manager
    
    greetd.greetd
    greetd.tuigreet

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
