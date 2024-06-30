{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
      hplip
    ];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "HP_WiFi";
        location = "Home";
        deviceUri = "http://192.168.178.2:631/printers/";
        model = "HP/hp-laserjet_tank_mfp_260x.ppd.gz";
        ppdOptions = {
          PageSize = "Letter";
        };
      }
      {
         name = "HP_USB";
        location = "Home";
        deviceUri = "http://192.168.178.2:631/printers/";
        model = "HP/hp-laserjet_tank_mfp_260x.ppd.gz";
        ppdOptions = {
          PageSize = "Letter";
        };

      }
    ];
    ensureDefaultPrinter = "HP_WiFi";
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
