{ pkgs, ... }:
{
  services = {
    # Enable touchpad support
    libinput.enable = true;

    # Enable printing services
    printing.enable = true;

    # Enable Samba shares and other stuff
    gvfs.enable = true;
    tumbler.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };

    # Power services
    upower.enable = true;

    # Thermald
    thermald.enable = true;

    # Power profiles
    power-profiles-daemon.enable = true;

    # Enable firmware updates
    fwupd.enable = true;

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Enable GNOME keyring
    gnome.gnome-keyring.enable = true;

    # Syncthing configuration
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "radeox";
      configDir = "/home/radeox/.config/syncthing";
    };

    # Flatpak configuration
    flatpak = {
      enable = true;

      # Auto-update
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };

      # Packages list
      packages = [
        "app.zen_browser.zen"
        "com.getpostman.Postman"
        "com.github.tchx84.Flatseal"
        "com.heroicgameslauncher.hgl"
        "com.spotify.Client"
        "com.valvesoftware.Steam"
        "io.ente.auth"
        "md.obsidian.Obsidian"
        "org.localsend.localsend_app"
        "org.mozilla.Thunderbird"
        "org.onlyoffice.desktopeditors"
        "org.qbittorrent.qBittorrent"
        "org.raspberrypi.rpi-imager"
        "org.telegram.desktop"
      ];
    };
  };

  # Flatpak shell aliases
  environment.shellAliases = {
    obsidian = "flatpak run md.obsidian.Obsidian";
    zen = "flatpak run app.zen_browser.zen";
  };

  security = {
    # Enable polkit
    polkit.enable = true;

    # Enable Hyprland GNOME keyring
    pam.services.hyprland.enableGnomeKeyring = true;
  };

  # Helps with file secrets/previews
  programs.gnome-terminal.enable = true;
}
