{ inputs, ... }:
{
  imports = [
    inputs.monique.nixosModules.default
  ];

  # Add the overlay
  nixpkgs.overlays = [
    inputs.monique.overlays.default
  ];

  # Enable Monique (MONitor Integrated QUick Editor)
  programs.monique.enable = true;

  # Enable Polkit for display manager integration
  programs.monique.enablePolkit = true;
}
