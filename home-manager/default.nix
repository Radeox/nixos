{ ... }:
{
  imports = [
    ./environment.nix
    ./ghostty.nix
    ./git.nix
    ./niri
    ./neovim.nix
    ./programs.nix
    ./shell.nix
    ./theme.nix
  ];

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Home configuration
  home = {
    username = "radeox";
    homeDirectory = "/home/radeox";
    stateVersion = "26.05";
  };
}
