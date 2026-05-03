{ pkgs, ... }:
{
  # Additional packages for Niri
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    hyprpicker
    nwg-look
  ];
}
