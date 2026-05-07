{ pkgs, ... }:
{
  hardware = {
    # Enable graphics drivers
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    # Enable bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;

      settings = {
        General = {
          # Show battery levels for connected devices
          Experimental = true;
        };

        Policy = {
          # Enable all controllers when they are found
          AutoEnable = true;
        };
      };
    };

    # Enable support for SANE scanners
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };

    # Enable the Xbox One controller driver
    xone.enable = true;
  };

  services = {
    # Pipewire configuration
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Disable pulseaudio
    pulseaudio.enable = false;
  };

  # For pipewire
  security.rtkit.enable = true;
}
