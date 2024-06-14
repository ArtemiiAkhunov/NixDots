{ pkgs, inputs, system, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
    ];
  };

  environment.systemPackages = with pkgs; [
    # Desktop Apps
    
    cinnamon.nemo
    audacity
    firefox
    telegram-desktop
    kitty
    kitty-themes
    obs-studio
    wofi
    mpv
    discord
    obsidian
    zoom-us
    zathura

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
    swww
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
    dunst
    wl-clipboard
    xwaylandvideobridge
    swaylock

    # Sound

    pipewire
    helvum

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
  ];

   fonts.packages = with pkgs; [
     font-awesome
     fira-code
     inconsolata
     nerdfonts
   ];

}
