{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ 
      # Coding utilities
      nss
      vscode
      # School Apps
      obsidian
      libreoffice-still
      cura-appimage
      openconnect
  ];
}
