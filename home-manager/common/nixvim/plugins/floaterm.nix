{
  programs.nixvim.plugins.floaterm = {
    enable = true;
    settings = {
      wintype = "split";
      autoinsert = true;
      height = 0.4;
      shell = "zsh";
      keymaps.toggle = "<leader>te";
    };
  };
}
