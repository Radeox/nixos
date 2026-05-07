{ ... }:
{
  imports = [
    ./aliases.nix
    ./extra.nix
    ./scripts.nix
    ./user.nix
  ];

  # Environment Variables
  environment = {
    localBinInPath = true;

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XCURSOR_THEME = "Qogir-Manjaro-Dark";
      XCURSOR_SIZE = "28";
      gnome_keyring_control = "/run/user/1000/keyring";
    };
  };
}
