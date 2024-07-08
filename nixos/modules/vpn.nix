{
  services.openvpn.servers = {
    config = '' config /home/voidwalker/.vpn/openvpn/buffalo.conf '';
      updateResolvConf = true;
  };
}
