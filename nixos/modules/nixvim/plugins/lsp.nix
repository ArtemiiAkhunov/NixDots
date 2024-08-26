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
      lua-ls = {
        enable = true;
        settings.telemetry.enable = false;
      };
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      marksman = {
        enable = true;
      };
    };
  };
}
