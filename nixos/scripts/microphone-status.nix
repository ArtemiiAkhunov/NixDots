{pkgs}: 
  pkgs.writeShellScriptBin "microphone-status" ''
    length="$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_SOURCE@ | wc -w)"
    if ((length == 2)); then
      echo "{\"text\": \"\"}"
    else
      echo "{\"text\": \"\"}"
    fi
  ''
