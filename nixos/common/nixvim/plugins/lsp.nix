{pkgs, ...}:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nixd = {
        enable = true;
      };
      pylsp = {
        enable = true;
      };
      lua_ls = {
        enable = true;
        settings.telemetry.enable = false;
      };
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      marksman = {
        enable = true;
      };
      tinymist = {
        enable = true;
        package = pkgs.tinymist;
        cmd = ["${pkgs.tinymist}/bin/tinymist"];
        settings.exportPdf = "onSave";
      };
    };
    keymaps = {
      lspBuf = {
        "<leader>hv" = "hover";
        "<leader>df" = "definition";
        "<leader>ca" = "code_action";
      };
      silent = true;
    };
  };
}
