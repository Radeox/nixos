{ inputs, ... }:
{
  imports = [
    inputs.monique.nixosModules.default
  ];

  # Enable Monique (MONitor Integrated QUick Editor)
  programs.monique.enable = true;

  # Enable Polkit for display manager integration
  programs.monique.enablePolkit = true;
}
