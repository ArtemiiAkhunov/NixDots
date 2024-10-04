{config, pkgs, ...}: {
  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableSshSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
    scdaemonSettings = {
      disable-ccid = true;
    };
  };
}
