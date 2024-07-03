{pkgs, ...}: {
  xdg.desktopEntries = {
    davinci-resolve = {
      name = "Davinci Resolve";
      genericName = "Video Editor";
      exec = "nvidia-offload ${pkgs.davinci-resolve}/bin/davinci-resolve";
      terminal = false;
      icon = "${pkgs.papirus-nord}/share/icons/Papirus/16x16/apps/resolve.svg";
      categories = [ "AudioVideo" "Video" "Utility" ];
    };
  };
}
