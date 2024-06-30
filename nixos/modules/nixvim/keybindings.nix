{config, lib, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          # Toggle neo tree ctrl + t
          "<leader>tr" = ":Neotree<CR>";

          # Esc to clear search
          "<esc>" = ":noh<CR>";

          # Save by ctrl + s
          "<C-s>" = ":w<CR>";

          # Debugger

          "<leader>dt" = ":lua require('dap').toggle_breakpoint()<CR>";

          "<leader>dc" = ":lua require('dap').continue()<CR>";

          # Formatting

          "<leader>fo" = ":lua vim.lsp.buf.format()<CR>";
        };
      visual = 
        lib.mapAttrsToList
          (key: action: {
            mode = "v";
            inherit action key;
          })
          {
          };
      in
        config.nixvim.helpers.keymaps.mkKeymaps
        {options.silent = true;}
        (normal ++ visual);
  };
}
