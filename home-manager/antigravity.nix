{ inputs, ... }:
{
  home.packages = [
    inputs.antigravity-nix.packages.x86_64-linux.default
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli
  ];
}
