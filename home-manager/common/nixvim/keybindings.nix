{ config, lib, ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps =
      let
        normal =
          lib.mapAttrsToList
            (key: action: {
              mode = "n";
              inherit action key;
            })
            {
              # Toggle neo tree ctrl + t
              "<leader>tr" = ":Neotree toggle<CR>";

              # Esc to clear search
              "<esc>" = ":noh<CR>";

              # Save by ctrl + s
              "<C-s>" = ":w<CR>";

              # Debugger

              "<leader>dt" = ":lua require('dap').toggle_breakpoint()<CR>";

              "<leader>dc" = ":lua require('dap').continue()<CR>";

              # Formatting

              "<leader>fo" = ":lua vim.lsp.buf.format()<CR>";

              # Diagnostics

              "<leader>dg" = ":lua vim.diagnostic.open_float()<CR>";

              # Git hunks

              "]c" = ":Gitsigns nav_hunk next<CR>";
              "[c" = ":Gitsigns nav_hunk prev<CR>";
              "<leader>gp" = ":Gitsigns preview_hunk<CR>";
              "<leader>gs" = ":Gitsigns stage_hunk<CR>";
              "<leader>gr" = ":Gitsigns reset_hunk<CR>";
              "<leader>gb" = ":Gitsigns blame_line<CR>";
            };
        visual = lib.mapAttrsToList (key: action: {
          mode = "v";
          inherit action key;
        }) { };
      in
      config.lib.nixvim.keymaps.mkKeymaps { options.silent = true; } (normal ++ visual);
  };
}
