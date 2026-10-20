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
        "netbird-wt0"
        "networkmanager"
        "render"
        "scanner"
        "video"
        "wheel"
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUbtFH4EMsYqXISQUmbnU6Jnbts335RLt1AGofiIsDY radeox@workstation"
      ];
    };

    defaultUserShell = pkgs.fish;
  };
}
