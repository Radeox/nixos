{ ... }:
{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Enable GDM (for login)
  services.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };

  security = {
    # Enable polkit
    polkit.enable = true;

    # Enable Hyprland GNOME keyring
    pam.services.hyprland.enableGnomeKeyring = true;
  };
}
