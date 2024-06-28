{
  programs.nixvim.plugins.dap = {
    enable = true;
    extensions.dap-ui.enable = true;
    extraOptions  =
    let
      dap = ''require("dap")'';
      dapui = ''require("dapui")'';
    in {
      "${dap}.listeners.before.attach.dapui_config" = 
      "function()
        ${dapui}.open()
      end";
      "${dap}.listeners.before.launch.dapui_config" = 
      "function()
        ${dapui}.open()
      end";
      "${dap}.listeners.before.event_terminated.dapui_config" = 
      "function()
        ${dapui}.close()
      end";
      "${dap}.listeners.before.event_exited.dapui_config" = 
      "function()
        ${dapui}.close()
      end";
    };
  };
}
