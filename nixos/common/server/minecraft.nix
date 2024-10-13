{ pkgs, ... }:
{
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/data/minecraft/";

    servers = {
      Dum-DumServer = {
        enable = true;
        package = pkgs.vanillaServers.vanilla-1_18_2;

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          # dificulty = "something";
          simulation-distance = 15;
          white-list = true;
          online-mode = false;
        };

        whitelist = {
          MadamOfTheLags = "52ab5996-386b-3ffc-a686-ac6b4a7fd802";
          # Add some more of my friends
        };
        jvmOpts = "-Xms5120M -Xmx5120M -XX:+UseZGC";
      };
    };
  };
}
