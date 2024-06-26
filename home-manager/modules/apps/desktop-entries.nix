{pkgs, ...}: {
  xdg.desktopEntries = {
    davinci-resolve = {
      name = "Davinci Resolve";
      genericName = "Video Editor";
      exec = "${pkgs.davinci-resolve}/bin/davinci-resolve";
      terminal = false;
      categories = [ "Application" "AudioVideo" "Video" "Utility" ];
    };
  };
}
