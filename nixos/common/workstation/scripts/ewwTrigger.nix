{pkgs, ...}:
pkgs.writeShellScriptBin "ewwTrigger" ''
  open=${pkgs.eww}/bin/eww active-windows | wc -w
  if[ ((open == 0)) ]; then
    ${pkgs.eww}/bin/eww open activate-linux
  else
    ${pkgs.eww}/bin/eww close activate-linux
  fi
''
