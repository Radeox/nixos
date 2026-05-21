{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
    quickemu
  ];

  # Virt-manager config
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "radeox" ];

  virtualisation = {
    # Docker config
    docker.enable = true;
    containers.enable = true;
    oci-containers.backend = "docker";

    # Spice USB redirection
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
  };
}
