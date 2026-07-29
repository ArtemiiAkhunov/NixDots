{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources.formatting = {
      stylua.enable = true;
      black.enable = true;
      isort.enable = true;
    };
  };
}
