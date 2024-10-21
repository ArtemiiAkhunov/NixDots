{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      indent.enable = true;
    };
  };
}
