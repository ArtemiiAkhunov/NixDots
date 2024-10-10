{ pkgs }:
pkgs.writeShellScriptBin "handle_monitor_connect" ''
  handle() {
    case $1 in monitoradded*)
      hyprctl reload
      swww init
    esac
  }

  ${pkgs.socat}/bin/socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
''
