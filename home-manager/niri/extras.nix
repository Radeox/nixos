{ pkgs, ... }:
{
  # Additional packages for Niri
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    grim
    grimblast
    hyprpicker
    libnotify
    nwg-look
    pavucontrol
  ];
}
