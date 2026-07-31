{ pkgs, ... }:
let
  versalinkB615 = pkgs.fetchurl {
    url = "https://answers.uillinois.edu/images/group356/shared/xrxb615.ppd";
    sha256 = "02j8xngin7ijqd7xa8lzf2lkls75j4fdym6bb2811kwz1zwrpiqx";
  };
  phaser5550 = pkgs.fetchurl {
    url = "https://answers.uillinois.edu/images/group356/shared/xr5550dt.ppd";
    sha256 = "1001hnjqpz5djdiqh3q9dgswzjx517pmx1na7if4slzbyfya79b4";
  };
  xeroxPpds = pkgs.runCommand "xerox-ppds" { } ''
    install -Dm444 ${versalinkB615} $out/share/cups/model/xrxb615.ppd
    install -Dm444 ${phaser5550} $out/share/cups/model/xr5550dt.ppd
  '';
in
{
  services.avahi = {
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  services.printing = {
    enable = true;
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
      hplip
      xeroxPpds
    ];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "HP_WiFi";
        location = "Home";
        deviceUri = "http://192.168.42.4:631/hp/device";
        model = "HP/hp-laserjet_tank_mfp_260x.ppd.gz";
        ppdOptions = {
          PageSize = "Letter";
        };
      }
    ];
    ensureDefaultPrinter = "HP_WiFi";
  };
}
