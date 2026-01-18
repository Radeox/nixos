{pkgs,...}:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/http" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/https" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/about" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/unknown" = [ "app.zen_browser.zen.desktop" ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "flatpak run app.zen_browser.zen";
  };
}
