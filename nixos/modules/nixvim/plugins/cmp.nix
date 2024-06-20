{
  programs.nixvim.plugins = {

    cmp-emoji.enable = true;

    cmp_luasnip.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = { 
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
        ];

        mapping = {
          "<CR>" =  "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
        };
        pylsp = {
          enable = true;
        };
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
      };
    };
  };
}
