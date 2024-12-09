{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "python-2.7.18.8" ];

  environment.systemPackages = with pkgs; [
    # Coding utilities

    gnumake
    gcc
    python
    (python3.withPackages (ps: with ps; [ requests ]))
    python311Packages.debugpy
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
