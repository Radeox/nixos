{ pkgs, ... }:
let
  jsonFormat = pkgs.formats.json { };
  ctrlW = builtins.fromJSON ''"\u0017"'';
  esc = builtins.fromJSON ''"\u001b"'';
in
{
  home.packages = with pkgs; [
    herdr-core
    herdr-desktop
  ];

  programs.herdr = {
    enable = true;
    settings = {
      onboarding = false;

      theme = {
        name = "gruvbox";
        auto_switch = false;
      };

      ui = {
        status_indicators = "dots";
        toast = {
          delivery = "system";
        };
      };
    };
  };

  xdg.configFile = {
    "herdr-app/settings.json".source = jsonFormat.generate "herdr-app-settings.json" {
      zoom = 1.0;
      sounds = {
        enabled = true;
      };
      font_size = 17.0;
      font_ligatures = false;
      minimum_contrast = 1.0;
      theme = {
        light = "paper";
        dark = "moss";
      };
    };

    "herdr-app/keys.json".source = jsonFormat.generate "herdr-app-keys.json" {
      global = {
        "alt-1" = "space.select:1";
        "alt-2" = "space.select:2";
        "alt-3" = "space.select:3";
        "alt-4" = "space.select:4";
        "alt-5" = "space.select:5";
        "alt-6" = "space.select:6";
        "alt-7" = "space.select:7";
        "alt-8" = "space.select:8";
        "alt-9" = "space.select:9";
        "alt-h" = "pane.go:left";
        "alt-j" = "pane.go:down";
        "alt-k" = "pane.go:up";
        "alt-l" = "pane.go:right";
        "alt-left" = "pane.go:left";
        "alt-down" = "pane.go:down";
        "alt-up" = "pane.go:up";
        "alt-right" = "pane.go:right";
        "alt-shift-h" = "pane.swap:left";
        "alt-shift-j" = "pane.swap:down";
        "alt-shift-k" = "pane.swap:up";
        "alt-shift-l" = "pane.swap:right";
        "ctrl-+" = "app.zoom_in";
        "ctrl--" = "app.zoom_out";
        "ctrl-0" = "app.zoom_reset";
        "ctrl-=" = "app.zoom_in";
        "ctrl-1" = "tab.select:1";
        "ctrl-2" = "tab.select:2";
        "ctrl-3" = "tab.select:3";
        "ctrl-4" = "tab.select:4";
        "ctrl-5" = "tab.select:5";
        "ctrl-6" = "tab.select:6";
        "ctrl-7" = "tab.select:7";
        "ctrl-8" = "tab.select:8";
        "ctrl-9" = "tab.select:9";
        "ctrl-pagedown" = "tab.next";
        "ctrl-pageup" = "tab.prev";
        "ctrl-tab" = "tab.next";
        "ctrl-shift-tab" = "tab.prev";
        "alt-]" = "tab.next";
        "alt-[" = "tab.prev";
        "ctrl-shift-pagedown" = "space.next";
        "ctrl-shift-pageup" = "space.prev";
        "ctrl-shift-down" = "agent.next";
        "ctrl-shift-up" = "agent.prev";
        "ctrl-?" = "app.help";
        "ctrl-shift-/" = "app.help";
        "ctrl-shift-?" = "app.help";
        "ctrl-shift-b" = "layout.toggle:sidebar";
        "ctrl-shift-n" = "space.new";
        "ctrl-shift-t" = "tab.new";
        "ctrl-shift-k" = "mod.open:picker";
        "ctrl-shift-p" = "app.palette";
        "ctrl-," = "app.settings";
        "ctrl-shift-o" = "pane.split:right";
        "ctrl-shift-e" = "pane.split:down";
        "ctrl-shift-w" = "tab.close";
        "ctrl-shift-x" = "pane.close";
        "ctrl-shift-z" = "pane.zoom";
        "ctrl-shift-l" = "layout.switch";
        "f2" = "tab.rename";
        "shift-f2" = "space.rename";
      };
      terminal = {
        "ctrl-backspace" = "send:${ctrlW}";
        "ctrl-left" = "send:${esc}b";
        "ctrl-right" = "send:${esc}f";
        "ctrl-shift-c" = "terminal.copy";
        "ctrl-shift-v" = "terminal.paste";
        "ctrl-shift-f" = "terminal.search";
        "ctrl-v" = "terminal.paste_image";
        "ctrl-insert" = "terminal.copy";
        "shift-insert" = "terminal.paste";
      };
    };
  };
}
