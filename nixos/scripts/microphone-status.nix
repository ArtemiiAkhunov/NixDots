{pkgs}: 
  pkgs.writeShellScriptBin "microphone-status" ''
  length="${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_SOURCE@ | wc -w"
  echo $length
  if ((length == 2)); then
    echo "{}";
  else
    echo "{}";
  fi;
  '';
