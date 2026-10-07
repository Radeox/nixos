{ ... }:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      font-size = 13;
      window-decoration = "none";
      resize-overlay = "never";

      # Fix for legacy SSH terminal issues
      shell-integration-features = "ssh-env";

      # Reduce mouse scroll speed
      mouse-scroll-multiplier = 0.5;

      # Disable clipboard paste protection
      clipboard-paste-protection = false;
    };
  };
}
