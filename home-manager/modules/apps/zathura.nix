{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    options = {
      font="Inconsolata 16";
    };
  };
}
