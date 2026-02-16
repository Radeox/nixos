{ ... }:
{
  services.flatpak = {
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

  environment.shellAliases = {
    obsidian = "flatpak run md.obsidian.Obsidian";
    zen = "flatpak run app.zen_browser.zen";
  };
}
