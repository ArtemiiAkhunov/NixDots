{ pkgs, ... }:
{
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/data/minecraft/";

    servers = {
      dumDumServer = {
        enable = true;
        package = pkgs.vanillaServers.vanilla-1_18_2;

        serverProperties = {
          gamemode = "survival";
          # dificulty = "something";
          simulation-distance = 15;
        };

        whitelist = {
          MadamOfTheLags = "f9f91bbf-5755-4de6-8828-0c54ab2bbb53";
          # Add some more of my friends
        };
        # TODO: jvmOpts = "";
      };
    };
  };
}
