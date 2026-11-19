{ pkgs, ... }:
{
  home.packages = with pkgs; [
    herdr-core
    herdr-desktop
  ];

  programs.herdr = {
    enable = true;
    settings = {
      onboarding = false;

      theme = {
        name = "gruvbox";
        auto_switch = false;
      };

      ui = {
        status_indicators = "dots";
        toast = {
          delivery = "system";
        };
      };
    };
  };
}
