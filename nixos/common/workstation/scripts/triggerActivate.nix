{pkgs, ...}:
pkgs.writeShellScriptBin "triggerActivate" ''
  open="$(${pkgs.eww}/bin/eww active-windows | grep 'activate-linux' | wc -w)"
  if ((open == 0)); then
    ${pkgs.eww}/bin/eww open activate-linux
  else
    ${pkgs.eww}/bin/eww close activate-linux
  fi
''
