{
  programs.nvim.plugins.none-ls = {
    enable = true;
    cmd = ["zsh -c nvim"];
    sources.formatting = {
      alejandra.enable = true;
      stylua.enable = true;
      shfmt.enable = true;
      nixpkgs_fmt.enable = true;
      google_java_format.enable = false;
      prettier = {
        enable = true;
        disableTsServerFormatter = true;
      };
      black = {
        enable = true;
        withArgs = ''
          {
            extra_args = { "--fast" },
          }
        '';
      };
    };
  };
}
