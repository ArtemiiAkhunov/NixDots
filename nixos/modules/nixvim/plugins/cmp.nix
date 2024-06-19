{
  programs.nixvim.plugins = {
    cmp-emoji.enable = true;
    
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
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = 
          ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end
          '';
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
