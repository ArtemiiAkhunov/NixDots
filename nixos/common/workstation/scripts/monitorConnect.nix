{ pkgs }:
pkgs.writeShellScriptBin "monitorConnect" ''
  handle() {
    case $1 in monitoradded*)
      ${pkgs.hyprland}/bin/hyprctl reload
      ${pkgs.swww}/bin/swww init
    esac
  }

  ${pkgs.socat}/bin/socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
''
