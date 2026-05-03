{ pkgs, ... }:
{
  # Enable Niri
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # Enable dconf for GTK settings
  programs.dconf.enable = true;

  # XDG Desktop Portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = [ "gnome" "gtk" ];
  };

  # Enable GDM (for login)
  services.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
}
