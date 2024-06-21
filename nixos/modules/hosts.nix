{
  networking.extraHosts = 
    ''
      http://192.168.5.58 pi-hole
      https://192.168.5.58:9443 portainer
      http://192.168.5.58:3000 chatgpt
      http://192.168.5.58:8096 jellyfin
    '';
}
