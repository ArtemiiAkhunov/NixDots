{
  programs.nixvim = {
    plugins.dap = {
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
    extraConfigLua = '' 
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

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "$${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }

      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
    '';
  };
}
