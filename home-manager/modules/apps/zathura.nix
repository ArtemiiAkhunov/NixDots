{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    options = {
      font="Inconsolata 16";
      default-bg = "#000000";
      default-fg = "#FFFFFF";
    };
  };
}
