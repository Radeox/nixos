{ ... }:
{
  # Enable and configure some additional programs
  programs = {
    # Fish shell
    fish.enable = true;

    # Help programs expecting FHS environment
    nix-ld.enable = true;

    # Other stuff
    gamemode.enable = true;
    dconf.enable = true;

    # Nautilus extension to open terminal
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };
  };
}
