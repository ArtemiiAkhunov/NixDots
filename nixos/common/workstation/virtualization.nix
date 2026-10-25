{ pkgs, ... }:
{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables; # kernel has no legacy ip_tables module
  };

  # The waydroid module trusts waydroid0, opening every host port to Android.
  # Allow only DHCP/DNS to the host and internet-only forwarding (no LAN/VPN).
  networking.firewall.extraCommands = ''
    iptables -D INPUT -i waydroid0 -j waydroid-in 2>/dev/null || true
    iptables -D FORWARD -i waydroid0 -j waydroid-fwd 2>/dev/null || true
    iptables -N waydroid-in 2>/dev/null || iptables -F waydroid-in
    iptables -N waydroid-fwd 2>/dev/null || iptables -F waydroid-fwd

    iptables -A waydroid-in -m conntrack --ctstate ESTABLISHED,RELATED -j RETURN
    iptables -A waydroid-in -p udp -m multiport --dports 53,67 -j RETURN
    iptables -A waydroid-in -p tcp --dport 53 -j RETURN
    iptables -A waydroid-in -j REJECT

    for net in 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 100.64.0.0/10 169.254.0.0/16 224.0.0.0/4; do
      iptables -A waydroid-fwd -d "$net" -j REJECT
    done

    iptables -I INPUT -i waydroid0 -j waydroid-in
    iptables -I FORWARD -i waydroid0 -j waydroid-fwd
  '';
  networking.firewall.extraStopCommands = ''
    iptables -D INPUT -i waydroid0 -j waydroid-in 2>/dev/null || true
    iptables -D FORWARD -i waydroid0 -j waydroid-fwd 2>/dev/null || true
    iptables -F waydroid-in 2>/dev/null || true
    iptables -F waydroid-fwd 2>/dev/null || true
    iptables -X waydroid-in 2>/dev/null || true
    iptables -X waydroid-fwd 2>/dev/null || true
  '';
  users.users.voidwalker.extraGroups = [ "libvirtd" ];
}
