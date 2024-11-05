{
  programs.ssh =
    let
      ed255_key_path = "/home/voidwalker/.ssh/id_ed25519";
    in
    {
      enable = true;
      matchBlocks = {
        theros = {
          hostname = "172.17.57.249";
          user = "voidwalker";
          identityFile = ed255_key_path;
        };
        data = {
          hostname = "data.cs.purdue.edu";
          user = "aakhunov";
          identityFile = ed255_key_path;
        };
        oracle = {
          hostname = "172.17.57.17";
          user = "ubuntu";
          itentity_file = "/home/voidwalker/.ssh/oracle";
        };
        xinu = {
          hostname = "xinu20.cs.purdue.edu";
          user = "aakhunov";
          identityFile = ed255_key_path;
        };
      };
    };
}
