{ pkgs, ... }: {
  programs = {
    # Enable steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    # Enable additional stuff
    gamemode.enable = true;
    gamescope.enable = true;
  };

  # Add Heroic launcher
  environment.systemPackages = with pkgs; [
    heroic
  ];
}
