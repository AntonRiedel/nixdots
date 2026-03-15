{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  programs.niri = {
    enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # greetd greeter
  programs.regreet = {
    enable = true;
  };

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
  ];

  services.tlp.enable = false; # Disable TLP
  services.gnome.gnome-keyring.enable = false; # Disable gnome keyring
  services.tuned.enable = true;
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    # wayland basics
    wayland
    wayland-protocols
    wayland-utils
    xwayland
    xwayland-satellite

    swaybg

    # hardware sensors
    iio-sensor-proxy

    # desktop utilities
    adwaita-icon-theme
    wl-clipboard
    grim
    slurp
    swappy
    cliphist
    nwg-clipman

    # monitor management
    kanshi

    # portals
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome

    pkgs-unstable.noctalia-shell
  ];
}
