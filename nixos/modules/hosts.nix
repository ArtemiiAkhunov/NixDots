{
  networking.extraHosts = 
    ''
      192.168.5.58 pi-hole
      192.168.5.58:9443 portainer
      192.168.5.58:3000 chatgpt
      192.168.5.58:8096 jellyfin
    '';
}
