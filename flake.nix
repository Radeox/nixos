{
  description = "Radeox - NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Manage dotfiles
    home-manager.url = "github:nix-community/home-manager/master";

    # NixOS hardware configurations
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Flatpak manager
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    # Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , home-manager
    , lanzaboote
    , nix-flatpak
    , nixos-hardware
    , stylix
    , ...
    }:
    {
      nixosConfigurations = {
        # ----- Legion Nix configuration -----
        Legion-Nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # NixOS hardware config for Lenovo Legion 5
            nixos-hardware.nixosModules.lenovo-legion-16iah7h

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Stylix - Theme manager
            stylix.nixosModules.stylix

            # Home Manager - Manage dotfiles
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  stylix.homeModules.stylix
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./software
            ./system

            # Host specific configuration
            ./hosts/legion.nix
          ];
        };

        # ----- Monoco configuration -----
        Monoco = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Stylix - Theme manager
            stylix.nixosModules.stylix

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  stylix.homeModules.stylix
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./software
            ./system

            # Host specific configuration
            ./hosts/monoco.nix
          ];
        };
      };
    };
}
