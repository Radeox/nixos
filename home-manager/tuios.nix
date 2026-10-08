{ pkgs, ... }:
let
  settings = {
    appearance = {
      dock_pill_caps = false;
      dock_workspace_tabs = true;
      session_border = false;
      session_colors = true;
      theme = "gruvbox_dark";
      window_title_position = "hidden";
      scrollbar = {
        style = "thin";
      };
      selection = {
        cursor_fg = "#08222B";
        match_fg = "#1C1B19";
        search_fg = "#F5E7C8";
      };
      sidebar = {
        show_glyphs = true;
      };
    };
    keybindings = {
      leader_key = "ctrl+e";
      system = {
        toggle_spotlight = [ ];
      };
      window_management = {
        next_session = [ "shift+tab" ];
        prev_session = [ ];
        prev_window = [ ];
      };
    };
    spotlight = {
      enabled = false;
    };
    startup = {
      daemon = true;
      open_default_window = true;
      start_in_terminal_mode = true;
      tiled = true;
    };
  };
in
{
  xdg.configFile."tuios/config.toml".source =
    (pkgs.formats.toml { }).generate "tuios-config.toml" settings;
}
