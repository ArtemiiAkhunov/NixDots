{ pkgs, ... }:
let
  userList = {
    MadamOfTheLags = "52ab5996-386b-3ffc-a686-ac6b4a7fd802";
    MewodyChan = "e9361905-58f1-34d6-b545-728c6c6b3324";
    RyugaMaster = "97bce91d-d35f-31e4-a54b-81948f4d158c";
    Liushu = "c150778b-e9f1-3c4b-ae29-1c24dffc1fb4";
    ProfTrench = "9f55640f-c2c1-3289-b707-c1ac3250e6d5";
    Reiiine = "e232bca4-2dd5-315d-b281-1f24f9277d8d";
    Littledreamystar = "d6f1120b-404f-3482-b1ed-d39c9592a60d";
  };
  modpack = builtins.fetchTarball {
    url = "https://github.com/LordOfTheLags/mods/archive/refs/tags/v0.1.1.tar.gz";
    sha256 = "1nzm7lqq9df89m4rw1l59wb9qddwqcg24z72ydd3aj19xijffnmr";
  };
in
{
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/data/minecraft/";

    servers = {

      mainServer = {
        enable = true;
        package = pkgs.vanillaServers.vanilla-1_21_11;

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          # dificulty = "something";
          simulation-distance = 15;
          white-list = true;
          online-mode = true;
        };

        whitelist = {
          MadamOfTheLags = "f9f91bbf-5755-4de6-8828-0c54ab2bbb53";
          Shoonatic = "6f7c02d9-a426-4b82-9960-989ec4ac4c0e";
        };
        jvmOpts = "-Xms10240M -Xmx10240M -XX:+UseZGC";
      };

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

      moddedDumDumServer = {
        enable = false;
        package = pkgs.fabricServers.fabric-1_21_1.override { loaderVersion = "0.17.3"; };

        operators = {
          MadamOfTheLags = {
            uuid = userList.MadamOfTheLags;
            level = 3;
            bypassesPlayerLimit = true;
          };
        };

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          dificulty = "normal";
          simulation-distance = 15;
          max-players = builtins.length (builtins.attrNames userList);
          white-list = true;
          online-mode = false;
          allow-cheats = true;
        };

        whitelist = userList;

        symlinks = {
          "mods" = "${modpack}";
        };

        jvmOpts = "-Xms10240M -Xmx10240M -XX:+UseZGC";
      };
    };
  };
}
