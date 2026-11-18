{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
  ];

  virtualisation = {
    # Docker config
    docker.enable = true;
    containers.enable = true;
    oci-containers.backend = "docker";
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };

  programs.virt-manager.enable = true;
  users.users.radeox.extraGroups = [ "libvirtd" ];

  systemd.tmpfiles.rules = [
    "d /var/lib/swtpm-localca 0750 tss tss -"
  ];
}
