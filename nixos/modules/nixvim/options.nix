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

    extraConfigLua = ''
      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      dapui.setup()
  '';
  };
}
