{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix

    ../../common/nix.nix
    ../../common/avahi.nix
    ../../common/nh.nix
    ../../common/nix.nix
    ../../common/packages.nix
    ../../common/polkit.nix
    ../../common/secrets.nix
    ../..common/user.nix
    ../../common/zerotier.nix

    ../../common/server/age.nix
    ../../common/server/docker.nix
    ../../common/server/ssh.nix
    ../../common/server/firewall.nix
  ];
}
