{ pkgs, config }:
let
  passwordFile = config.age.secrets.nut_admin_password.path;
in
pkgs.writeShellScriptBin "upsShutdown" ''
  #password="$(cat ${passwordFile})"
  #${pkgs.nut}/bin/upscmd -u admin -p $password spark@localhost:3494 shutdown.return
  ${pkgs.systemd}/bin/shutdown -p +0
''
