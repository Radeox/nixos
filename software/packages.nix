{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    ansible
    antigravity-fhs
    awscli2
    bleachbit
    cargo
    cmake
    dig
    duf
    dust
    evince
    fastfetch
    fd
    ffmpeg
    file-roller
    fzf
    gcc
    gemini-cli
    gimp
    git
    git-extras
    gnome-calculator
    gnome-disk-utility
    gnome-text-editor
    gnumake
    gparted
    grc
    home-manager
    htop
    imagemagick
    inkscape
    killall
    loupe
    mariadb.client
    mongodb-compass
    mongodb-tools
    nautilus
    nautilus-python
    nil
    nix-search-cli
    nmap
    nodejs_24
    opentofu
    pciutils
    php85
    quickemu
    rar
    remmina
    ripgrep
    rpiboot
    scrcpy
    seahorse
    showtime
    simple-scan
    speedtest-cli
    sshfs
    tree-sitter
    udiskie
    ungoogled-chromium
    unzip
    usbimager
    veracrypt
    vlc
    wget
    whois
    witr
    wl-clipboard
    zip

    # Python
    isort
    python314
    ruff
    uv
    uv-sort

    # VPN
    openvpn
    wireguard-tools
  ];

  # Add OpenVPN plugin to NetworkManager
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openvpn
  ];
}
