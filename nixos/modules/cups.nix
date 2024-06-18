{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint pkgs.gutenprintBin pkgs.canon-cups-ufr2 ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
