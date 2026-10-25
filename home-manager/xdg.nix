{ pkgs, ... }:
{
  xdg = {
    # Setup MIME
    mimeApps = {
      enable = true;

      defaultApplications = {
        # HTML and Browser
        "text/html" = [ "zen-beta.desktop" ];
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
        "x-scheme-handler/about" = [ "zen-beta.desktop" ];
        "x-scheme-handler/unknown" = [ "zen-beta.desktop" ];

        # File Manager (Nautilus)
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "x-scheme-handler/file" = [ "org.gnome.Nautilus.desktop" ];

        # PDF
        "application/pdf" = [ "zen-beta.desktop" ];

        # Images
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "image/webp" = [ "org.gnome.Loupe.desktop" ];

        # Video
        "video/mp4" = [ "vlc.desktop" ];
        "video/mpeg" = [ "vlc.desktop" ];
        "video/x-matroska" = [ "vlc.desktop" ];
        "video/webm" = [ "vlc.desktop" ];
        "video/quicktime" = [ "vlc.desktop" ];
        "video/x-msvideo" = [ "vlc.desktop" ];

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
        "video/mp4" = [ "vlc.desktop" ];
      };
    };

    # Setup portals
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
  };
}
