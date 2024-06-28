{
  programs.nixvim.plugins.dap = {
    enable = true;
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
    extensions = {
      dap-ui = {
        enable = true;
        floating.mappings = {
          close = ["<ESC>" "q"];
        };
      };
      dap-python.enable = true;
      dap-virtual-text.enable = true;
    };
  };
}
