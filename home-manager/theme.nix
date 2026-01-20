{ pkgs, lib, ... }:
{
  stylix = {
    enable = true;
    # Explicitly set dark mode
    polarity = "dark";

    # Apply everforest-dark-hard theme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    # Enable Flatpak support for GTK applications
    targets.gtk.flatpakSupport.enable = true;

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  # Use mkForce to resolve the conflict with Stylix
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = lib.mkForce "Adwaita:dark";
    };
  };

  home.sessionVariables = {
    GTK_THEME = lib.mkForce "Adwaita:dark";
    ADW_DEBUG_COLOR_SCHEME = lib.mkForce "prefer-dark";
  };
}
