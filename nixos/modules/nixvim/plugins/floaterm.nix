{
  programs.nixvim.plugins.floaterm = {
    enable = true;
    autoinsert = true;
    height = 0.4;
    wintype = "split";
    shell = "zsh";
    keymaps.toggle = "<leader>te";
  };
}
