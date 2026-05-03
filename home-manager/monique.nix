{ pkgs, ... }:
{
  # Enable the Monique daemon for automatic monitor profile switching
  systemd.user.services.moniqued = {
    Unit = {
      Description = "Monique hotplug daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      # The package is provided by the NixOS module which adds it to the overlay or environment
      ExecStart = "${pkgs.monique}/bin/moniqued";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
