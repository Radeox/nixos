{ pkgs, lib, ... }:
{
  # Enable Niri
  programs.niri.enable = true;

  # ReGreet for login
  programs.regreet = {
    enable = true;

    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  # Disable stylix for ReGreet
  stylix.targets.regreet.enable = false;

  # Enable dconf for GTK settings
  programs.dconf.enable = true;

  # XDG Desktop Portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };

      gamescope = {
        default = [ "gtk" ];
      };

      niri = {
        default = lib.mkForce [
          "wlr"
          "gtk"
        ];
      };
    };
  };
}
