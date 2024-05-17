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
  # texlive.combined.scheme-full
  # python3Packages.pygments

  # gui
  xorg.xhost
  lightlocker
  flameshot
  # qtile
  xcompmgr
  zoom-us
  # xdg-desktop-portal-hyprland
  # gnome.adwaita-icon-theme

  # misc
  alacritty
  kitty

  vim
  unzip
  git
  wget
  acpid
  pciutils

  # password manager
  # pass
  # passff-host
  # passExtensions.pass-otp
  # gnupg
  # pinentry-qt
  

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
