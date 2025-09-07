{ pkgs, ... }: let
  userList = {
    MadamOfTheLags = "52ab5996-386b-3ffc-a686-ac6b4a7fd802";
    MewodyChan = "e9361905-58f1-34d6-b545-728c6c6b3324";
    RyugaMaster = "97bce91d-d35f-31e4-a54b-81948f4d158c";
    Ailani = "810273d9-1fe0-3149-bd8f-3e9fbae58fb1";
    ProfTrench = "9f55640f-c2c1-3289-b707-c1ac3250e6d5";
  };
  /*
  modpack = builtins.fetchTarball {
    url = "https://github.com/LordOfTheLags/mods/releases/download/release/mods.tar.gz";
    sha256 = "05w53ym90f6s30nbmvvrgvyjmh8kn856ybdz1ry12nv4m61l2c2d"
  };*/
in 
{
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/data/minecraft/";

    servers = {
      dumDumServer = {
        enable = false;
        package = pkgs.vanillaServers.vanilla-1_20_2;

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          # dificulty = "something";
          simulation-distance = 15;
          white-list = true;
          online-mode = false;
        };

        whitelist = userList;
        jvmOpts = "-Xms10240M -Xmx10240M -XX:+UseZGC";
      };

      /*moddedDumDumServer = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_1.override { loaderVersion = "0.17.2"; };

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          dificulty = "normal";
          simulation-distance = 15;
          max-players = 5;
          white-list = true;
          online-mode = false;
        };

        whitelist = userList;

        symlinks = {
          "mods" = "${modpack}";
        };

        jvmOpts = "-Xms10240M -Xmx10240M -XX:+UseZGC";
      };*/
    };
  };
}
