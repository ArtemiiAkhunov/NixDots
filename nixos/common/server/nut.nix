{ pkgs, config, ... }:
{
  power.ups = {
    enable = true;
    openFirewall = true;
    mode = "netserver"; # TODO: update to be a server
    ups.spark = {
      description = ''"UPS for Servers"'';
      driver = ''"usbhid-ups"'';
      port = ''"auto"'';
      directives = [
        ''vendorid = "0764"''
        ''productid = "0601"''
        ''product = "CP1000PFCLCDa"''
        ''serial = "CX1PY7001483"''
        ''vendor = "CPS"''
        ''bus = "001"''
        ''device = "002"''
        ''busport = "004"''
      ];
    };

    upsmon = {
      monitor.spark = {
        system = "spark@localhost:3494";
        powerValue = 1;
        user = "admin";
        type = "primary";
        passwordFile = config.age.secrets.nut_admin_password.path;
      };
      settings = { 
        FINALDELAY = 180;
        SHUTDOWNCMD = ''
          ${pkgs.upsShutdown}/bin/upsShutdown
        '';
      };
    };
    upsd = {
      enable = true;
      listen = [
        {
          address = "0.0.0.0";
          port = 3494;
        }
      ];
    };

    users = {
      admin = {
        actions = [
          "set"
          "fsd"
        ];
        instcmds = [
          "all"
        ];
        upsmon = "primary";
        passwordFile = config.age.secrets.nut_admin_password.path;
      };
      observer = {
        passwordFile = config.age.secrets.nut_observer_password.path;
        upsmon = "secondary";
      };
    };
  };
}
