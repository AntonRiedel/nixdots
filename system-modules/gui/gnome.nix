{ ... }:
{
  # Enable the GNOME desktop environment
  # it uses wayland by default even though it is defined under xserver
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # disable pulseaudio explicitly
  hardware.pulseaudio.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "eu";
    variant = "";
  };
}
