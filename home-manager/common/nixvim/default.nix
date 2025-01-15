{

  imports = [
    ./plugins/plugin-bundle.nix
    ./options.nix
    ./keybindings.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
  };
}
