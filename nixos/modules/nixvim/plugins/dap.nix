{
  programs.nixvim.plugins.dap = {
    enable = true;
    extensions = {
      dap-ui = {
        enable = true;
        layouts = [
          {
            elements = [
              {
                id = "scopes";
                size = 0.25;
              }
              {
                id = "breakpoints";
                size = 0.25;
              }
              {
                id = "stacks";
                size = 0.25;
              }
              {
                id = "watches";
                size = 0.25;
              }
            ];
            position = "left";
            size = 40;
          }
          {
            elements = [
              {
                id = "repl";
                size = 0.5;
              }
              {
                id = "console";
                size = 0.5;
              }
            ];
            position = "bottom";
            size = 10;
          }
        ];
      };
      dap-python.enable = true;
    };
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
