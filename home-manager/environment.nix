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

        # File Manager (Nautilus)
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "x-scheme-handler/file" = [ "org.gnome.Nautilus.desktop" ];

        # PDF
        "application/pdf" = [ "app.zen_browser.zen.desktop" ];

        # Images
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "image/webp" = [ "org.gnome.Loupe.desktop" ];

        # Video
        "video/mp4" = [ "org.gnome.Showtime.desktop" ];
        "video/mpeg" = [ "org.gnome.Showtime.desktop" ];
        "video/x-matroska" = [ "org.gnome.Showtime.desktop" ];
        "video/webm" = [ "org.gnome.Showtime.desktop" ];
        "video/quicktime" = [ "org.gnome.Showtime.desktop" ];
        "video/x-msvideo" = [ "org.gnome.Showtime.desktop" ];

        # Archives
        "application/zip" = [ "org.gnome.FileRoller.desktop" ];
        "application/x-tar" = [ "org.gnome.FileRoller.desktop" ];
        "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ];

        # Text files
        "text/plain" = [ "org.gnome.TextEditor.desktop" ];
        "text/markdown" = [ "org.gnome.TextEditor.desktop" ];

        # Calculator
        "x-scheme-handler/calculator" = [ "org.gnome.Calculator.desktop" ];
      };

      # This part "adds" the capability to the desktop entry
      associations.added = {
        "x-scheme-handler/calculator" = [ "org.gnome.Calculator.desktop" ];
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "video/mp4" = [ "org.gnome.Showtime.desktop" ];
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
