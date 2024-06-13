{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme="catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}
