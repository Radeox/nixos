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

      # Disable clipboard paste protection
      clipboard-paste-protection = false;
    };
  };
}
