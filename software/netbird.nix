{ config, lib, ... }: {

  services.netbird = {
    clients.wt0 = {
      config = {
        ManagementURL = {
          Scheme = "https";
          Host = "netbird.radeox.it:443";
        };
        AdminURL = {
          Scheme = "https";
          Host = "netbird.radeox.it:443";
        };
      };

      login = {
        enable = true;
        setupKeyFile = "/home/radeox/Documents/Netbird/${lib.toLower config.networking.hostName}.key";
      };

      port = 51821;
      ui.enable = false;
      openFirewall = true;
      openInternalFirewall = true;
    };

    useRoutingFeatures = "both";
  };

  # SSH service configuration (exclusively for NetBird mesh)
  services.openssh = {
    enable = true;
    openFirewall = false; # Do not open port 22 globally on all interfaces

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Allow SSH exclusively on the NetBird private mesh interface
  networking.firewall.interfaces."nb-wt0".allowedTCPPorts = [ 22 ];
}
