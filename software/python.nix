{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    isort
    python314
    ruff
    uv
    uv-sort
  ];
}
