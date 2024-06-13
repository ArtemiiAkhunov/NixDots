{ pkgs, ... }: {
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
    vim
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
    papirus-icon-theme

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

    #other
    plasma5Packages.sddm
    home-manager
  ];

   fonts.packages = with pkgs; [
     font-awesome
     fira-code
     inconsolata
     nerdfonts
   ];

}
