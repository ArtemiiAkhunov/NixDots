{
  services.openvpn.servers = {
    protonVPN = {
      config = ''/home/voidwalker/.vpn/nl-free-184131.protonvpn.udp.ovpn'';
      updateResolvConf = true;
    };
  };
}
