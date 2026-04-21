{ pkgs, ... }: {
  services = {
    # Enable tailscale
    tailscale = {
      enable = true;
      openFirewall = true;
    };

    # Enable sunshine
    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  # Install Moonlight
  environment.systemPackages = with pkgs; [
    moonlight-qt
  ];

  # Tailscale firewall config
  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ 41641 ];
  };
}
