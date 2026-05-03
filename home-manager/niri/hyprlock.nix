{ lib, ... }: {
  # Hyprlock configuration
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = lib.mkForce [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = lib.mkForce [
        {
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgb(222222)";
          inner_color = "rgb(200, 200, 200)";
          font_color = "rgb(42, 42, 42)";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -120";
          halign = "center";
          valign = "center";
        }
      ];

      label = lib.mkForce [
        {
          text = "$TIME";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 90;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
