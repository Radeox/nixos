{ pkgs, ... }:
{
  # Install noctalia-greeter
  environment.systemPackages = [
    pkgs.noctalia-greeter
  ];

  # Enable polkit
  security.polkit.enable = true;

  # Native noctalia-greeter session managed directly by greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.noctalia-greeter}/bin/noctalia-greeter-session";
      };
    };
  };

  # Enable dconf for GTK settings
  programs.dconf.enable = true;
}
