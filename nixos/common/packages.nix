{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "python-2.7.18.8" ];

  environment.systemPackages = with pkgs; [
    # Coding utilities

    gnumake
    gcc
    python312
    (python312.withPackages (ps: with ps; [ requests ]))
    python312Packages.debugpy
    python312Packages.evdev
    vscode-extensions.ms-vscode.cpptools
    gdb
    rustc
    cargo

    # CLI stuff

    fastfetch
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

    # Non-nixpkgs binaries
    cachix

    # Networking
    cacert

    #Other
    home-manager
  ];

  fonts.packages =
    with pkgs;
    [
      font-awesome
      fira-code
      inconsolata
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

}
