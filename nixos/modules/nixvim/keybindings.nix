{
  programs.nixvim = {
    globals = {
      mapleader = "\\";
      maplocalleader = "\\";
    };

    keymaps = let
      normal =
        lib.mapAttrToList
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
        };
      visual = 
        lib.mapAttrToList
          (key: action: {
            mode = "v";
            inherit action key;
          })
          {
          };
      in
        config.nixvim.helpers.keymaps.mhKeymaps
        {options.silent = true;}
        (normal ++ visual);
  };
}
