{
  programs.waybar.settings.mainBar = {
    modules-center = [ "niri/workspaces" ];
    position="right";
    "niri/workspaces" = {
      format = "{value}";
    };
  };
}
