{ config, ... }:
{
  power.ups = {
    enable = true;
    openFirewall = true;
    mode = "netserver"; # TODO: update to be a server
    ups.spark = {
      description = "UPS for Servers";
      driver = "usbhid-ups";
      port = "auto";
      summary = ''
        vendorid = "0764"
        productid = "0601"
        product = "CP1000PFCLCDa"
        serial = "CX1PY7001483"
        vendor = "CPS"
      '';
    };

    upsmon = {
      monitor.spark = {
        system = "spark@localhost";
        powerValue = 1;
        user = "admin";
        type = "primary";
        passwordFile = config.age.secrets.nut_admin_password;
      };
    };
    upsd = {
      enable = true;
      listen = [
        {
          address = "0.0.0.0";
          port = "3494";
        }
      ];
    };

    users ={
      admin = {
        actions = [
          "set"
          "fsd"
        ];
        instcmds = [
          "all"
        ];
        passwordFile = config.age.secrets.nut_admin_password;
      };
      observer = {
        passwordFile = config.age.secrets.nut_observer_password;
        upsmon = "secondary";
      };
    };
  };
}
