{ pkgs, ... }:
{
  home.packages = [
    pkgs.xwayland-satellite
    pkgs.xwayland
  ];

  # Xwayland-satellite systemd user service
  # This provides X11 support for Niri
  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland outside your Wayland compositor";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  home.sessionVariables = {
    DISPLAY = ":0";
  };
}
