{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      theros = {
        hostname = "192.186.5.58";
        user = "voidwalker";
        identityFile = "$HOME/.ssh/theros.pub";
      };
    };
  };
}
