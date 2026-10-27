{ lib, ... }:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      font-size = 13;
      window-decoration = "none";
      resize-overlay = "never";

      # Background styling: frosted glass and dark
      background-opacity = lib.mkForce 0.85;
      background-blur = true;

      # Fix for legacy SSH terminal issues
      shell-integration-features = "ssh-env";

      # Reduce mouse scroll speed
      mouse-scroll-multiplier = 0.5;

      # Disable clipboard paste protection
      clipboard-paste-protection = false;
    };
  };
}
