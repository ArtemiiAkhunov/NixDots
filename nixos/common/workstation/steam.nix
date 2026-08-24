{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    cockatrice
    protonup-ng
    mangohud
  ];

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/voidwalker/.steam/root/compatibilitytools.d";
  };
}
