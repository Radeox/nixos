{ pkgs, inputs, ... }:
{

  programs = {
    # Zen browser
    zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };

    # Bat configuration
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batwatch
        prettybat
      ];
    };
  };

  # Antigravity
  home.packages = [
    inputs.antigravity-nix.packages.x86_64-linux.default
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli
  ];

  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "radeox" ];
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "zen-beta";
  };
}
