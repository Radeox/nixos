{ ... }:
{
  imports = [
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./niri.nix
    ./noctalia.nix
    ./programs.nix
    ./shell.nix
    ./theme.nix
    ./xdg.nix
    ./xwayland.nix
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
