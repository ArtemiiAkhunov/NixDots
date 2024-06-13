{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      silent = true;

      next = "<C-TAB>";
      previous = "<C-S-TAB>";
    };
  };
}
