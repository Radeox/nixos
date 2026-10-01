# NixOS Configuration

A modular, flake-based NixOS configuration powering desktop and laptop machines with the [Niri](https://github.com/epireyn/niri-flake) scrollable tiling Wayland compositor, managed via Home Manager and themed system-wide using Stylix.

---

## 🖥️ Hosts & Hardware

The configuration targets two x86_64 hosts configured in [`flake.nix`](file:///etc/nixos/flake.nix):

| Host             | Description / Profile              | Key Modules & Drivers                                                                                                                      |
| :--------------- | :--------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------- |
| **`Legion-Nix`** | Lenovo Legion 5 Laptop (`16IAH7H`) | `nixos-hardware.nixosModules.lenovo-legion-16iah7h`, NVIDIA proprietary drivers (`nvidia`), Lenovo Legion kernel module, TPM2 + Lanzaboote |
| **`Monoco`**     | AMD Desktop                        | AMDGPU driver (`amdgpu`), KVM AMD virtualization, TPM2 + Lanzaboote                                                                        |

---

## 🏗️ Architecture & Directory Structure

```text
/etc/nixos/
├── flake.nix             # Flake inputs, outputs, and system definitions (Legion-Nix, Monoco)
├── flake.lock            # Pinned flake input revisions
├── hosts/                # Machine-specific hardware and kernel configurations
│   ├── legion.nix        # Lenovo Legion laptop definitions
│   └── monoco.nix        # Desktop definitions
├── system/               # Core OS configurations
│   ├── default.nix       # System module aggregator
│   ├── system.nix        # Linux Zen kernel, Nix daemon tweaks, store auto-optimise
│   ├── networking.nix    # NetworkManager, OpenVPN plugins, and firewall rules
│   └── secureboot.nix    # Lanzaboote UEFI Secure Boot and TPM2 integration
├── hardware/             # System hardware setup
│   └── default.nix       # PipeWire audio, Bluetooth, SANE scanners, Xbox (xone) controller
├── software/             # System-level software & desktop services
│   ├── default.nix       # Software module aggregator
│   ├── login.nix         # Noctalia greeter managed via greetd, polkit
│   ├── niri.nix          # Niri system enablement and XDG desktop portals
│   ├── services.nix      # D-Bus, upower, thermald, power-profiles-daemon, fwupd, Avahi, CUPS
│   ├── gaming.nix        # Steam session wrapper, sxhkd audio bindings, Gamemode
│   ├── virt.nix          # Docker, OCI containers, QuickEMU, SPICE USB redirection
│   ├── packages.nix      # Core system-wide packages and utilities
│   └── flatpak.nix       # Declarative Flatpak package management via nix-flatpak
├── environment/          # System shell environment & helpers
│   ├── default.nix       # Environment variables (Wayland/Ozone, XCursor)
│   ├── user.nix          # User account definition (`radeox`)
│   ├── aliases.nix       # System-wide shell aliases (nix-rebuild, lazydocker, etc.)
│   ├── scripts.nix       # Custom utility scripts (activate-venv, docker-clean, myip, VPN toggles)
│   └── extra.nix         # Miscellaneous integrations (nix-ld, OpenLogi, Monique, Valent/KDE Connect)
└── home-manager/         # User dotfiles and environment management (user: radeox)
    ├── default.nix       # Home Manager aggregator and user state
    ├── niri.nix          # Niri compositor keybindings, layout, window rules, monitors
    ├── noctalia.nix      # Noctalia shell and status bar configuration
    ├── ghostty.nix       # Ghostty terminal emulator settings
    ├── shell.nix         # Fish shell configuration, plugins (done, fzf-fish, grc)
    ├── neovim.nix        # AstroNvim (Lazy.nvim bootstrap, Node/Python providers)
    ├── git.nix           # Git user profile and Lazygit configuration
    ├── theme.nix         # Stylix dark theme (gruvbox-material-dark-medium) and typography
    ├── programs.nix      # User desktop packages (Zen Browser, bat, Antigravity)
    ├── tuios.nix         # TUIOS terminal workspace environment
    ├── xdg.nix           # Default MIME associations and XDG user directories
    └── xwayland.nix      # Xwayland-satellite systemd user service for X11 compatibility
```
