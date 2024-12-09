{
  makeDesktopItem,
  fetchurl,
  appimageTools,
}:
let
  pname = "cura-appimage";
  version = "5.9.0";
  src = fetchurl {
    url = "https://github.com/Ultimaker/Cura/releases/download/5.9.0/UltiMaker-Cura-5.9.0-linux-X64.AppImage";
    hash = "sha256-STtVeM4Zs+PVSRO3cI0LxnjRDhOxSlttZF+2RIXnAp4=";
  };
  outputDerivation = appimageTools.wrapType2 {
    inherit pname version src;
    desktopItems = [
      (makeDesktopItem {
        name = "cura";
        exec = "cura-appimage";
        terminal = false;
        desktopName = "Cura";
        categories = [ "Utility" ];
      })
    ];
  };
in
outputDerivation
