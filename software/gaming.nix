{ pkgs, ... }: {
  programs = {
    steam = {
      # Enable steam
      enable = true;

      # Open firewall for games
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      # Create steam session for login
      gamescopeSession.enable = true;
    };

    # Enable additional stuff
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  # Add Heroic launcher
  environment.systemPackages = with pkgs; [
    heroic
  ];
}
