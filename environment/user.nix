{ pkgs, ... }:
{
  # User Configuration
  users = {
    users.radeox = {
      isNormalUser = true;
      description = "Radeox";
      extraGroups = [
        "adbusers"
        "dialout"
        "docker"
        "kvm"
        "lp"
        "networkmanager"
        "render"
        "scanner"
        "video"
        "wheel"
      ];
    };
    defaultUserShell = pkgs.fish;
  };
}
