{
  programs.nixvim = {
    
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      updatetime = 300;

      mouse = "a"; # Use mouse
      mousemodel = "extend"; # Right Click Extends Current Line Selection
      
      relativenumber = true; # Display relative line numbers
      number = true; # Display absolute line numbers

      hidden = true; # keep hidden buffer closed in the background

      swapfile = false; # No swap files

      expandtab = true; # Expand tabs into spaces
      autoindent = true; # Auto tab
      smartindent = true; # Smarter tab
      shiftwidth = 2; # 
      tabstop = 2;
      
      encoding = "utf8"; # Encoding of the file

      incsearch = true;
      ignorecase = true;
      smartcase = true;

      cursorcolumn = false;
      cursorline = false;

      undofile = true; # Saves history
    };
  };
}
