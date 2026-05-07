{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "radeox" ];
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "zen-beta";
  };
}
