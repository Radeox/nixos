{ pkgs, ... }:
{
  xdg = {
    # Setup MIME
    mimeApps = {
      enable = true;
      defaultApplications = {
        # HTML and Browser
        "text/html" = [ "app.zen_browser.zen.desktop" ];
        "x-scheme-handler/http" = [ "app.zen_browser.zen.desktop" ];
        "x-scheme-handler/https" = [ "app.zen_browser.zen.desktop" ];
        "x-scheme-handler/about" = [ "app.zen_browser.zen.desktop" ];
        "x-scheme-handler/unknown" = [ "app.zen_browser.zen.desktop" ];

        # PDF
        "application/pdf" = [ "app.zen_browser.zen.desktop" ];

        # Text files
        "text/plain" = [ "org.gnome.TextEditor.desktop" ];
        "text/markdown" = [ "org.gnome.TextEditor.desktop" ];

        # Calculator
        "x-scheme-handler/calculator" = [ "gnome-calculator-handler.desktop" ];
      };
    };

    # Setup portals
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "flatpak run app.zen_browser.zen";
  };
}
