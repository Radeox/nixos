{ ... }:
{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Enable GDM (for login)
  services.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
}
