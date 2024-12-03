{
  lib,
  stenv,
  fetchurl,
  appimageTools
}:
let
  pname = "cura-appimage";
  version = "5.9.0";
  src = fetchurl {
    url = "https://github.com/Ultimaker/Cura/releases/download/5.9.0/UltiMaker-Cura-5.9.0-linux-X64.AppImage";
    hash = "";
  };
  outputDerivation = appimageTools.wrapType2 {
    inherit pname version src;
  };
in 
outputDerivation
