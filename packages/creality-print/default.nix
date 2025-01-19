{
  makeDesktopItem,
  fetchurl,
  appimageTools,
}:
let
  pname = "creality-print-appimage";
  version = "5.9.0";
  src = fetchurl {
    url = "https://github.com/CrealityOfficial/CrealityPrint/releases/download/v5.1.6/Creality_Print-v5.1.6.10470-x86_64-Release.AppImage";
    hash = "sha256-gS7b41UEvjwUWjCAWjJbD5Xz8QblZkT6tv5ceRhjYfI=";
  };
  outputDerivation = appimageTools.wrapType2 {
    inherit pname version src;
    desktopItems = [
      (makeDesktopItem {
        name = "creality-print";
        exec = "creality-print-appimage";
        terminal = false;
        desktopName = "Creality Print";
        categories = [ "Utility" ];
      })
    ];
  };
in
outputDerivation
