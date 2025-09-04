{ pkgs, ... }: let
  userList = {
    MadamOfTheLags = "52ab5996-386b-3ffc-a686-ac6b4a7fd802";
    MewodyChan = "e9361905-58f1-34d6-b545-728c6c6b3324";
    RyugaMaster = "97bce91d-d35f-31e4-a54b-81948f4d158c";
    Ailani = "810273d9-1fe0-3149-bd8f-3e9fbae58fb1";
    ProfTrench = "9f55640f-c2c1-3289-b707-c1ac3250e6d5";
  };
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
      moddedDumDumServer = {
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
         /* mods = pkgs.linkFarmFromDrvs "mods" (
            builtins.attrValues {
              WTHIT = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/6AQIaxuO/versions/nILqdVZG/wthit-fabric-4.13.6.jar";
                sha512 = "1527d4f05d3001f373754ca8048b7674a701cf6db46772d01b9137516767b50d39e2ee0aa063b828ad6b0cd2796773bb62f25f83ebc2b11d32f4e5348dfe6242";
              };
              badpackets = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/ftdbN0KK/versions/vH59yR5Z/badpackets-fabric-0.1.3.jar";
                sha512 = "4f6d2e96a5944cd3d2e1a16ff69e159b77eb9cb11a8d1977b678742881de0e4d10895cdedc97c259eade94b107f12fcb9392d1562396d24f23a63af1b63fed9e";
              };
              Sodium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/AANobbMI/versions/mc1.18.2-0.4.1/sodium-fabric-mc1.18.2-0.4.1%2Bbuild.15.jar";
                sha512 = "86eb4db8fdb9f0bb06274c4f150b55273b5b770ffc89e0ba68011152a231b79ebe0b1adda0dd194f92cdcb386f7a60863d9fee5d15c1c3547ffa22a19083a1ee";
              };
              Indium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Orvt0mRa/versions/1.0.7%2Bmc1.18.2/indium-1.0.7%2Bmc1.18.2.jar";
                sha512 = "cdd32ac79e7cb423af95dbd618c383a9e240e84f53eeb02029f679142e4b980e39c7db8190a2cdb542c23067d56c6b7d29bc21204709028ee5538a659f7cf95f";
              };
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/mc1.18.2-0.7.9/lithium-fabric-mc1.18.2-0.7.9.jar";
                sha512 = "6c2128734a7e49301e49f394b62c4995aaed3cdd88fd20f7dd265db3dbafb6c5bb193e9705d5533585ee397ed713aaedfb843b05be2c4c7dd90a86321c2e8cfc";
              };
              Phosphor = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/hEOCdOgW/versions/mc1.18.x-0.8.1/phosphor-fabric-mc1.18.x-0.8.1.jar";
                sha512 = "6a06f397f5f054f12334b81251dbdbd9c82c7e4e41810d6708a9d40966da113560c6f23e95f6f5ed52cfe1e843f7f71910a84b2bb476354456ff11be668a4c1d";
              };
              FabricAPI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/qk28POfr/fabric-api-0.77.0%2B1.18.2.jar";
                sha512 = "adb62b0d73e83cf9302a59a55ffe7ca2cf6f4ebb34312ec09e0f56b99ebc173e02dd4f0b8ec059d7262a14857dc1911645b090e460f20fd8e2d48aa5f2fdbefa";
              };
              JEI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/u6dRKJwZ/versions/NVuQhfP5/jei-1.18.2-fabric-10.2.1.1002.jar";
                sha512 = "e5aa700e96709d6035c948421f59c4a26c373d1a2b6f706a2ec21377e4fae1dfa149cd7403dbcb5d41e583e133c6f9400973bb43e991f9daa62159a93bedee26";
              };
              ArchitectryAPI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/lhGA9TYQ/versions/ql0OowZw/architectury-4.12.94-fabric.jar";
                sha512 = "ae824f839f8d7fe1ec2942bc66b2c22b1aeb837cce98e0c412235082dc930653bd076f2dc898d0c9c6d2c30fa5acca5145047418d07b550b942bdc67fb41886d";
              };
              Create = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Xbc0uyRg/versions/ACfVIQMB/create-fabric-0.5.1-f-build.1415%2Bmc1.18.2.jar";
                sha512 = "86dff0663110c674438c8159362cb918202547ba97006697fdeac16f1b7c2b7be36dbca6afac7626faf5eb033a4af050014d6871d8564fecb95b746c926435cf";
              };
              CreateCrafts = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/kU1G12Nn/versions/BwU7P7Cf/createaddition-fabric-1.18.2-20230704a.jar";
                sha512 = "768f8ca1bce31d5d68cf0a385239107f86187055fc6c102f647fdac8b149cbc6fbe90c26d3124dc7edc9287dce4362fa1adbf965da8556d8aa9418fc214b795f";
              };
              CreateGoggles = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/L1RT5SJc/versions/sDHIIWBm/creategoggles-1.18.2-0.5.5.f-%5BFABRIC%5D.jar";
                sha512 = "fb281840e2ccadbe728e3c88c68e5eb73af04f1702d6f8c383425f05a67e0c61079bcdecf4a51e506d22bf26b98ff2cb9922243ce95ddb481d4ffbbbf61ae497";
              };
              CreateUtilities = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/PRHeWeBs/versions/SOnDqlpU/createutilities-0.3.0%2B1.18.2.jar";
                sha512 = "3a1c538c712164f5ecd7a06d448bb7e3d67809b648ff5d64f291db5d5e2b90c205d290feb389a82515c0f74ab25c484c65e3766da2e72787d73df4aadebae325";
              };
            }
          );*/
        };
        jvmOpts = "-Xms10240M -Xmx10240M -XX:+UseZGC";
      };
    };
  };
}
