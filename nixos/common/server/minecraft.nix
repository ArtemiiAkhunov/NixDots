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
  # Real Mojang account UUIDs (required for online-mode = true). ProfTrench
  # omitted: no current Mojang account matches that username.
  onlineUserList = {
    MadamOfTheLags = "f9f91bbf-5755-4de6-8828-0c54ab2bbb53";
    MewodyChan = "fea8cb5f-cfdc-4949-a7f3-3b543e9fa97f";
    RyugaMaster = "4d934410-bc63-4d3c-b0e7-b756ff37021d";
    Liushu = "da8f5788-b464-465d-a45e-2543b5eb36e1";
    Reiiine = "ddad4ba1-92d9-4578-a994-1623e1cb3262";
    Littledreamystar = "1d3388ed-ea23-439a-96ef-33d49fe1c31f";
  };
  modpack = builtins.fetchTarball {
    url = "https://github.com/LordOfTheLags/modpack/archive/refs/tags/v1.0.tar.gz";
    sha256 = "0rh9b0ajp0bd0j4pvlds9psl9wsxb8zaslasra3x5k48pr6gjgpi";
  };
in
{
  networking.firewall.allowedUDPPorts = [ 24454 ]; # Simple Voice Chat

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/data/minecraft/";

    servers = {

      dumDumServer = {
        enable = false;
        package = pkgs.neoforgeServers.neoforge-1_21_1.override { jre_headless = pkgs.jdk21_headless; };

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          # dificulty = "something";
          simulation-distance = 15;
          white-list = true;
          online-mode = false;
        };

        whitelist = userList;
        jvmOpts = "-Xms8G -Xmx8G -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:+ParallelRefProcEnabled -XX:G1HeapRegionSize=16M";
      };

      moddedDumDumServer = {
        enable = true;
        package = pkgs.neoforgeServers.neoforge-1_21_1.override { jre_headless = pkgs.jdk21_headless; };

        operators = {
          MadamOfTheLags = {
            uuid = onlineUserList.MadamOfTheLags;
            level = 3;
            bypassesPlayerLimit = true;
          };
        };

        serverProperties = {
          gamemode = "survival";
          motd = "Yes, it's a minecraft server!";
          difficulty = "normal";
          simulation-distance = 15;
          max-players = builtins.length (builtins.attrNames onlineUserList);
          white-list = true;
          online-mode = true;
          allow-cheats = true;
          # Vanilla default (16) blocks all non-op players from breaking/placing
          # near world spawn; only MadamOfTheLags is opped, so everyone else was
          # locked out there. Disabled for a private friends server.
          spawn-protection = 0;
        };

        whitelist = onlineUserList;

        symlinks = {
          "mods" = "${modpack}/mods";
          "world/datapacks" = "${modpack}/datapacks";
        };

        files = {
          "config" = "${modpack}/config";
        };

        jvmOpts = "-Xms8G -Xmx8G -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:+ParallelRefProcEnabled -XX:G1HeapRegionSize=16M";
      };
    };
  };
}
