{config, lib, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = "\\";
      maplocalleader = "\\";
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
          "<C-t>" = ":Neotree<CR>";

          # Esc to clear search
          "<esc>" = ":noh<CR>";

          # Save by ctrl + s
          "<C-s>" = ":w<CR>";

          "<leader>dt" = "require('dap').toggle_breakpoint";

          "<leader>dc" = "require('dap').continue";

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
