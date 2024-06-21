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
          {name = "emoji";}
          {name = "path";}
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {
            name = "luasnip";
            keywordLength = 3;
          }
        ];

        mapping = {
          "<CR>" =  "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        };
      };
    };
  };
}
