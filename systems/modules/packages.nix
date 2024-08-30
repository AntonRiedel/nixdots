{ pkgs, ... }:
{
  # list packages installed in system profile
  environment.systemPackages = with pkgs; [

  # networking
  openssh
  networkmanager-openvpn
  networkmanagerapplet

  # hardware
  lm_sensors
  brightnessctl
  acpid
  acpi
  pciutils

  # gui (wayland)
  #waybar
  #hyprpaper
  #hyprlock
  #kanshi
  #hyprshot
  #wofi
  #wl-clipboard
  #dmenu-wayland
  #libsForQt5.qt5.qtwayland
  #kdePackages.qtwayland

  # gui (x11)
  dunst
  upower
  lightlocker
  arandr
  xcompmgr
  autorandr
  nitrogen

  # misc
  kitty
  nextcloud-client
  pwvucontrol
  zoom-us

  # minimal cli for root user
  vim

  # virtualization
  virt-manager
  virtiofsd
  distrobox

  ];

  # allow unfree packages like zoom
  nixpkgs.config.allowUnfree = true;

  programs.adb.enable = true;
  programs.dconf.enable = true;
  programs.direnv.enable = true; 
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
