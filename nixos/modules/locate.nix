{pkgs, ...}: {
  services.locate = {
    enable = true;
    package = pkgs.findutils;
  };
}
