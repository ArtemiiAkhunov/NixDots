{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
      "<leader>hf" = "help_tags";
      "<leader>fg" = "live_grep";
      "<leader>fh" = "oldfiles";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
    extensions.ui-select.enable = true;
  };
}
