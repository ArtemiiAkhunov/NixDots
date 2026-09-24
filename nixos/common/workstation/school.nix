{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # General Apps
    evince
    firefox
    imv
    mpv
    # Coding utilities
    kitty
    kitty-themes
    nss
    vscode
    # School Apps
    obsidian
    libreoffice
    cura-appimage
    openconnect
  ];
}
