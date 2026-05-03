{ pkgs, ... }:
{
  # Timezone and Locale
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

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
        "scanner"
        "video"
        "wheel"
      ];
    };
    defaultUserShell = pkgs.fish;
  };

  # Environment Variables
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XCURSOR_THEME = "Qogir-Manjaro-Dark";
      XCURSOR_SIZE = "28";
    };
    localBinInPath = true;

    # Shell Aliases
    shellAliases = {
      # NixOS commands
      nix-update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos && flatpak update -y";
      nix-config = "cd /etc/nixos && vim";
      nix-clean = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot";

      # General Aliases
      ai = "aichat";
      d = "lazydocker";
      dc = "docker compose";
      g = "lazygit";
      ll = "ls -l";
      p = "ps aux | grep ";
      r = "ranger";
      rgrep = "rg";
      sl = "ls";
      sudo = "sudo ";
      a = "antigravity . && exit";

      # Replacement Aliases
      cat = "bat -p";
      df = "duf";
      du = "dust";
    };
  };

  imports = [
    ./scripts.nix
  ];
}
