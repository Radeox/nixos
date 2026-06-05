{ pkgs, ... }:
{
  # Enable and configure some additional programs
  programs = {
    # Fish shell
    fish.enable = true;

    # Help programs expecting FHS environment
    nix-ld.enable = true;

    # KDE Connect
    kdeconnect = {
      enable = true;
      package = pkgs.valent;
    };

    # Other stuff
    dconf.enable = true;

    # Nautilus extension to open terminal
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };
  };

  # Disable coredump file (Antigravity bug)
  systemd.coredump.settings = {
    Coredump = {
      Storage = "none";
      ProcessSizeMax = "0";
    };
  };
}
