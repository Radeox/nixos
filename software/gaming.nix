{ pkgs, ... }: {
  programs = {
    steam = {
      # Enable steam
      enable = true;

      # Open firewall for games
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
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

  # Custom steam launcher in regreeted
  services.displayManager.sessionPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "steam-gamescope-custom-session";
      version = "1.0";
      dontUnpack = true;
      passthru.providedSessions = [ "steam-gamescope" ];

      installPhase = ''
        mkdir -p $out/share/wayland-sessions
        cat << 'EOF' > $out/share/wayland-sessions/steam-gamescope.desktop
        [Desktop Entry]
        Name=Steam
        Comment=Steam Big Picture
        Exec=${pkgs.gamescope}/bin/gamescope -f -e -F fsr -- ${pkgs.steam}/bin/steam -gamepadui -steamos3
        Type=Application
        EOF
      '';
    })
  ];
}
