{
  services.openvpn.servers = {
    buffaloVPN = {
      config = '' config /home/voidwalker/.vpn/openvpn/buffalo.conf '';
      updateResolvConf = true;
    };
  };
}
