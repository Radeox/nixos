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

      # Reduce mouse scroll speed (default is too fast, ~50 lines)
      mouse-scroll-multiplier = 0.1;

      # Disable clipboard paste protection
      clipboard-paste-protection = false;
    };
  };
}
