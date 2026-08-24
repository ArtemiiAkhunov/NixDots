{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "python-2.7.18.8" ];

  environment.systemPackages = with pkgs; [
    # CLI stuff

    fastfetch
    claude-code
    nodejs
    herdr
    context7-mcp
    python3
    pciutils
    usbutils
    file
    tree
    wget
    git
    btop
    unzip
    zip
    killall
    bind
    fzf
    sl
    ripgrep
    speedtest-cli
    typst
    borgbackup

    # Networking
    cacert

    #Other
    home-manager
  ];
}
