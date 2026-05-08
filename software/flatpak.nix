{ ... }:
{
  # Flatpak configuration
  services.flatpak = {
    enable = true;

    # Auto-update
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };

    # Packages list
    packages = [ ];
  };
}
